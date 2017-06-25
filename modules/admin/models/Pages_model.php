<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pages_model extends CI_Model {
    
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
    
    function get_page($id){
        $result = $this->db->select('*')->where('id', $id)->get('pages')->row_array();
        return $result;
    }

    function count_all_user($table){
        $result = $this->db->count_all($table); 
        return $result;
    }


}