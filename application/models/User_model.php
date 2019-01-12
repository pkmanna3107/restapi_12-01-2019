<?php

defined('BASEPATH') OR exit('No direct script access allowed');
class User_model extends CI_Model{


    /*VIEW USER DATA*/
    public function read($mtbl_user_id=""){
        if(!empty($mtbl_user_id)){
        $query = $this->db->get_where('mtbl_user', array('mtbl_user_id' => $mtbl_user_id));
        return $query->row_array();
        }else{
        $query = $this->db->get('mtbl_user');
        return $query->result_array();
        }
    }

    /*INSERT USER DATA*/
    public function insert($data){
        $this->db->insert('mtbl_user', $data);
        return TRUE;
    }

    /*INSERT TOKEN DATA*/
    public function insert2($data2){
        $this->db->insert('trnz_user_login', $data2);
        return TRUE;
    }

    /*UPDATE USER DATA*/
    public function update($data, $mtbl_user_idnew) {
        if(!empty($data) && !empty($mtbl_user_idnew)){
        $update = $this->db->update('mtbl_user', $data, array('mtbl_user_id'=>$mtbl_user_idnew));
        return $update?true:false;
        }else{
        return false;
        }
    }


    /*DELETE USER DATA*/
    public function delete($mtbl_user_id){
        $delete = $this->db->delete('mtbl_user',array('mtbl_user_id'=>$mtbl_user_id));
        return $delete?true:false;
    }

    /*LOGIN USER DATA*/
    function getRows($params = array()){
        $this->db->select('*');
        $this->db->from('mtbl_user');
        //fetch data by conditions
        if(array_key_exists("conditions",$params)){
        foreach($params['conditions'] as $key => $value){
        $this->db->where($key,$value);
        }
        }
        if(array_key_exists("mtbl_user_id",$params)){
        $this->db->where('mtbl_user_id',$params['mtbl_user_id']);
        $query = $this->db->get();
        $result = $query->row_array();
        }else{
        //set start and limit
        if(array_key_exists("start",$params) && array_key_exists("limit",$params)){
        $this->db->limit($params['limit'],$params['start']);
        }elseif(!array_key_exists("start",$params) && array_key_exists("limit",$params)){
        $this->db->limit($params['limit']);
        }
        if(array_key_exists("returnType",$params) && $params['returnType'] == 'count'){
        $result = $this->db->count_all_results();    
        }elseif(array_key_exists("returnType",$params) && $params['returnType'] == 'single'){
        $query = $this->db->get();
        $result = ($query->num_rows() > 0)?$query->row_array():false;
        }else{
        $query = $this->db->get();
        $result = ($query->num_rows() > 0)?$query->result_array():false;
        }
        }
        //return fetched data
        return $result;
    }


    /*INSERT INTO 'trnz_login_session' TOKEN DATA AFTER USER LOGIN*/
    public function insert3($data34){
        $this->db->insert('trnz_login_session', $data34);
        return TRUE;
    }

    public function readsingledata($mtbl_user_idnew=""){
        if(!empty($mtbl_user_idnew)){
        $query = $this->db->get_where('mtbl_user', array('mtbl_user_id' => $mtbl_user_idnew));
        return $query->row_array();
        }
    }


}
