 <?php
use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';


class Example extends REST_Controller {

    function __construct()
    {
        // Construct the parent class
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->model('User_model');
        $this->load->helper('string');
        /*Load Authorization token library*/
        $this->load->library('Authorization_Token');
        // Configure limits on our controller methods
        // Ensure you have created the 'limits' table and enabled 'limits' within application/config/rest.php
        $this->methods['users_get']['limit'] = 500; // 500 requests per hour per user/key
        $this->methods['users_post']['limit'] = 100; // 100 requests per hour per user/key
        $this->methods['users_put']['limit'] = 100; // 100 requests per hour per user/key
        $this->methods['users_delete']['limit'] = 50; // 50 requests per hour per user/key
        $this->methods['GetTokenData_post']['limit'] = 100; // 50 requests per hour per user/key
        $this->methods['verification_put']['limit'] = 100; // 50 requests per hour per user/key
    }

    /*USER DATA VIEW*/
    public function users_get($mtbl_user_id=0)
    {
        //returns all rows if the id parameter doesn't exist,
        //otherwise single row will be returned
        $users = $this->User_model->read($mtbl_user_id);
        //check if the user data exists
        if(!empty($users)){
        //set the response and exit
        $this->response($users, REST_Controller::HTTP_OK);
        }else{
        //set the response and exit
        $this->response([
        'status' => FALSE,
        'message' => 'No users were found.'
        ], REST_Controller::HTTP_NOT_FOUND);
        }
    }


    /*USER DATA INSERT*/
    public function users_post()
    {
        $user_first_name = $this->post('user_first_name');
        $user_surname_name = $this->post('user_surname_name');
        $user_email_id = $this->post('user_email_id');
        $user_mobile_number = $this->post('user_mobile_number');
        if(!empty($user_first_name) && !empty($user_surname_name) && !empty($user_email_id) && !empty($user_mobile_number)){
        $user_password = random_string('alnum', 16);     
        $user_access_salt = random_string('alnum', 16);
        $url = "https://verification/".random_string('alnum', 16);
        //$this->form_validation->set_rules('user_email_id', 'Email address', 'trim|valid_email');

        $this->form_validation->set_rules('user_email_id', 'Email address', 'required|valid_email|is_unique[mtbl_user.user_email_id]');

        if($this->form_validation->run() === FALSE)
        { 
        $this->response( array( 'status' => validation_errors() ), 406);  
        }              
        $data = array(
        'user_first_name' => $user_first_name,
        'user_surname_name' => $user_surname_name,
        'user_email_id' => $user_email_id,
        'user_password' => $user_password,
        'user_mobile_number' => $user_mobile_number,
        'user_category_id' => 1,
        'user_registration_date' => date('Y-m-d'),
        'user_is_active' => 'N',
        'user_state' => 1,
        'user_access_salt' => $user_access_salt,
        'user_verify_url' => $url
        );
        //insert user data
        $insert = $this->User_model->insert($data); 
        $lastid = $this->db->insert_id();
        //check if the user data inserted
        if($insert){
        $token_data['user_access_salt'] = $user_access_salt;
        $user_token  =  $this->authorization_token->generateToken($token_data);
        $data2 = array(
        'user_login_token' => $user_token,
        'user_login_session_id' => $lastid,
        'user_access_salt' => $user_access_salt
        );
        //insert token data
        $insert2 = $this->User_model->insert2($data2);
        //set the response and exit
        $this->response([
        'status' => TRUE,
        'message' => 'User has been added successfully.',
        'token' => $user_token
        ], REST_Controller::HTTP_OK);
        }else{
        //set the response and exit
        $this->response("Some problems occurred, please try again.", REST_Controller::HTTP_BAD_REQUEST);
        }
        }else{
        //set the response and exit
        $this->response("Provide complete user information to create.", REST_Controller::HTTP_BAD_REQUEST);
        }
    }


    /*USER DATA UPDATE*/
    public function users_put() {
        $userData = array();
        $mtbl_user_id = $this->put('mtbl_user_id');
        $userData['user_first_name'] = $this->put('user_first_name');
        $userData['user_surname_name'] = $this->put('user_surname_name');
        $userData['user_email_id'] = $this->put('user_email_id');
        $userData['user_mobile_number'] = $this->put('user_mobile_number');
        $userData['last_update_date'] = date('Y-m-d');


        $received_Token = $this->input->request_headers('Authorization');
        try
            {
            $jwtData22 = $this->authorization_token->userData($received_Token);
            //echo json_encode($jwtData22);
            }
            catch (Exception $e)
            {
            http_response_code('401');
            echo json_encode(array( "status" => false, "message" => $e->getMessage()));
            exit;
            }
            $jwtData = $jwtData22->user_access_salt;

        $this->db->where('user_access_salt', $jwtData);
        $q = $this->db->get('mtbl_user');
        $data = $q->result_array();
        $mtbl_user_idnew = $data[0]['mtbl_user_id'];


        //update user data
        $update = $this->User_model->update($userData, $mtbl_user_idnew);
        //check if the user data updated
        if($update){
        //set the response and exit
        $this->response([
        'status' => TRUE,
        'message' => 'User has been updated successfully.',
        'data'=> $userData
        ], REST_Controller::HTTP_OK);
        }else{
        //set the response and exit
        $this->response("Some problems occurred, please try again.", REST_Controller::HTTP_BAD_REQUEST);
        }

    }


    /*USER DATA DELETE*/
    public function users_delete($mtbl_user_id){
        //check whether post id is not empty
        if($mtbl_user_id){
        //delete post
        $delete = $this->User_model->delete($mtbl_user_id);
        if($delete){
        //set the response and exit
        $this->response([
        'status' => TRUE,
        'message' => 'User has been removed successfully.'
        ], REST_Controller::HTTP_OK);
        }else{
        //set the response and exit
        $this->response("Some problems occurred, please try again.", REST_Controller::HTTP_BAD_REQUEST);
        }
        }else{
        //set the response and exit
        $this->response([
        'status' => FALSE,
        'message' => 'No users were found.'
        ], REST_Controller::HTTP_NOT_FOUND);
        }
    } 



/*User Login with JWT token*/
    public function login_post() {
        // Get the post data
        $user_email_id = $this->post('user_email_id');
        $user_mobile_number = $this->post('user_mobile_number');
        $user_password = $this->post('user_password');
        // Validate the post data
        if(!empty($user_email_id)  && !empty($user_password)){


        // Check if any user exists with the given credentials
        $con['returnType'] = 'single';
        $con['conditions'] = array(
        'user_email_id' => $user_email_id,
        'user_password' => $user_password
        );
        $user = $this->User_model->getRows($con);
        if($user){


        $this->db->where(array('user_email_id' => $user_email_id, 'user_password' => $user_password));
        $q = $this->db->get('mtbl_user');
        $data = $q->result_array();
        $user_is_active = $data[0]['user_is_active'];

        if($user_is_active == 'Y'){


        //Generate Token
        $token_data['user_password'] = $user_password;
        $user_token  =  $this->authorization_token->generateToken($token_data);


        $data34 = array(
        'login_session_inst_datetime' => date('Y-m-d H:i:s'),
        'login_session_validity' => 1,
        'login_session_access_meta' => $user_token
        );
 

        $insert3 = $this->User_model->insert3($data34);



        // Set the response and exit
        $this->response([
        'status' => TRUE,
        'message' => 'User login successful.',
        'data' => $user,
        'token' => $user_token
        ], REST_Controller::HTTP_OK);


        }else{
        $this->response("You have not verified your account. Please verify First.", REST_Controller::HTTP_BAD_REQUEST);    
        }

        }else{
        // Set the response and exit
        //BAD_REQUEST (400) being the HTTP response code
        $this->response("Wrong email or wrong password.", REST_Controller::HTTP_BAD_REQUEST);
        }


        }elseif(!empty($user_mobile_number) && !empty($user_password)){



        // Check if any user exists with the given credentials
        $con['returnType'] = 'single';
        $con['conditions'] = array(
        'user_mobile_number' => $user_mobile_number,
        'user_password' => $user_password
        );
        $user = $this->User_model->getRows($con);
        if($user){


        $this->db->where(array('user_mobile_number' => $user_mobile_number, 'user_password' => $user_password));
        $q = $this->db->get('mtbl_user');
        $data = $q->result_array();
        $user_is_active = $data[0]['user_is_active'];

        if($user_is_active == 'Y'){

        //Generate Token
        $token_data['user_password'] = $user_password;
        $user_token  =  $this->authorization_token->generateToken($token_data);


        $data34 = array(
        'login_session_inst_datetime' => date('Y-m-d H:i:s'),
        'login_session_validity' => 1800,
        'login_session_access_meta' => $user_token
        );
 

        $insert3 = $this->User_model->insert3($data34);



        // Set the response and exit
        $this->response([
        'status' => TRUE,
        'message' => 'User login successful.',
        'data' => $user,
        'token' => $user_token
        ], REST_Controller::HTTP_OK);

        }else{
        $this->response("You have not verified your account. Please verify First.", REST_Controller::HTTP_BAD_REQUEST);    
        }

        }else{
        // Set the response and exit
        //BAD_REQUEST (400) being the HTTP response code
        $this->response("Wrong mobile number or wrong password.", REST_Controller::HTTP_BAD_REQUEST);
        }



        }else{
        // Set the response and exit
        $this->response("Provide email or mobile number and password.", REST_Controller::HTTP_BAD_REQUEST);
        }
    }


   public function GetTokenData_post(){
        $received_Token = $this->input->request_headers('Authorization');
        try
            {
            $jwtData = $this->authorization_token->userData($received_Token);
            echo json_encode($jwtData);
            }
            catch (Exception $e)
            {
            http_response_code('401');
            echo json_encode(array( "status" => false, "message" => $e->getMessage()));exit;
            }
    }



    /*USER VERIFICATION*/ 
    public function verification_put() {
        $userData = array();
        $mtbl_user_id = $this->put('mtbl_user_id');
        $userData['user_is_active'] = 'Y';
        $userData['last_update_date'] = date('Y-m-d');


        $received_Token = $this->input->request_headers('Authorization');
        try
            {
            $jwtData22 = $this->authorization_token->userData($received_Token);
            //echo json_encode($jwtData22);
            }
            catch (Exception $e)
            {
            http_response_code('401');
            echo json_encode(array( "status" => false, "message" => $e->getMessage()));exit;
            }
            $jwtData = $jwtData22->user_access_salt;

        $this->db->where('user_access_salt', $jwtData);
        $q = $this->db->get('mtbl_user');
        $data = $q->result_array();
        $mtbl_user_idnew = $data[0]['mtbl_user_id'];

        if($data[0]['user_is_active'] == 'N'){

        //update user data
        $update = $this->User_model->update($userData, $mtbl_user_idnew);
        //check if the user data updated
        if($update){
        //set the response and exit
        $this->response([
        'status' => TRUE,
        'message' => 'User verification has been completed successfully.',
        'data'=> $userData
        ], REST_Controller::HTTP_OK);
        }else{
        //set the response and exit
        $this->response("Some problems occurred, please try again.", REST_Controller::HTTP_BAD_REQUEST);
        }

        }else{

            $this->response("You have already verified your account.", REST_Controller::HTTP_BAD_REQUEST);

        }

    }


    /*SINGLE USER DATA VIEW USING TOKEN*/
    public function profile_get()
    {

        $received_Token = $this->input->request_headers('Authorization');
        try
            {
            $jwtData22 = $this->authorization_token->userData($received_Token);
            //echo json_encode($jwtData22);
            }
            catch (Exception $e)
            {
            http_response_code('401');
            echo json_encode(array( "status" => false, "message" => $e->getMessage()));exit;
            }
            $jwtData = $jwtData22->user_password;

        $this->db->where('user_password', $jwtData);
        $q = $this->db->get('mtbl_user');
        $data = $q->result_array();
        $mtbl_user_idnew = $data[0]['mtbl_user_id'];


        //returns all rows if the id parameter doesn't exist,
        //otherwise single row will be returned
        $users = $this->User_model->readsingledata($mtbl_user_idnew);
        //check if the user data exists
        if(!empty($users)){
        //set the response and exit
        $this->response($users, REST_Controller::HTTP_OK);
        }else{
        //set the response and exit
        $this->response([
        'status' => FALSE,
        'message' => 'No users were found.'
        ], REST_Controller::HTTP_NOT_FOUND);
        }
    }


}
