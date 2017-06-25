<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users_model extends CI_Model {
    
    function __construct()
    {
        parent::__construct();
    }

    //Функция выбирает каталог по meta_url
    function get_table($table)
    {
        $query = $this->db->get($table)->result_array(); 
        return $query;
        
    }
    
    function get_user($id){
        $result = $this->db->select('*')->where('id', $id)->get('users')->row_array();
        return $result;
    }

    function count_user($table,$permiss){
        //$result = $this->db->count_all_results($id); // всего записей
        $result = $this->db->where('group_id', $permiss);
        $result = $this->db->from($table);
        $result =$this->db->count_all_results();
        return $result;
    }
    
    


}