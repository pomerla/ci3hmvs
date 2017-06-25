<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Settings extends MX_Controller {
    
    function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library('common/main_lib');
    }
     
    // массив нужных для всех остальных страниц настроек
    function get_settings()
    {
        $settings = $this->db->get('settings')->result_array();
        $data = array();
        foreach ($settings as $key => $value)
        {
            $data[$value['name']] = $value['value'];
        }
        return $data;
    }
 
    // выбор одной настройки сайта
    function get_one_setting($name)
    {
        $this->db->where("name", $name);
        $query = $this->db->get('settings');
        $data = $query->row_array();
        return $data['value'];
    }
    
    

}