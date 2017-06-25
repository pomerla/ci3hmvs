<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends MX_Controller {

    function __construct()
    {
        parent::__construct();
        $seg = $this->uri->segment(2);
        if ($seg!="install" && $seg!= "install_action") {
            if (file_exists('install.txt')) {
                redirect(base_url('install/install'), 'location');
            }
        }
        $this->load->database();
        $this->load->model('pages_model');
        $this->load->library('common/main_lib');
        //обработка определения языка
        if(!isset($_SESSION["lang"])){
            $result = $this->db->select('*')->where('default', '1')->get('language')->row_array(); // выборка ленгвиж из таблицы настройки сайта
        }else{ 
            $result['language'] = $_SESSION["lang"]; 
        }
        $directory = 'modules/admin/language/'.$result['language']; // вместо language/russian дефолт ленгвиж из базы
        //
        $this->load->library('common/language',$directory);
        $this->language->load('common/login');
        
        //общая библиотека языка
        $this->lang->load($result['language'],$result['language']);
        
    }

	public function index()
	{
        $login = $this->input->post('login');
        $password = md5($this->input->post('password'));
        
        
        
        if(isset($login)){
            $data = $this->main_lib->get_users($login, 'users');
            $passmd5 = md5($data['password']);
        }
        
        if($this->session->userdata('logged_in') == '1'){
            
            // добавляем на главную админки перевод
            
            $data = array(
                'title' => 'Главная админки',
                'text_home_site' => $this->language->get('text_home_site'),
                'text_profile' => $this->language->get('text_profile'),
                'text_exit' => $this->language->get('text_exit'),
                'text_pages' => $this->language->get('text_pages'),
                'text_pages_view' => $this->language->get('text_pages_view'),
                'text_pages_add' => $this->language->get('text_pages_add'),
                'text_add' => $this->language->get('text_add'),
                'text_files' => $this->language->get('text_files'),
                'text_plugins' => $this->language->get('text_plugins'),
                'text_add_plugins' => $this->language->get('text_add_plugins'),
                'text_settings' => $this->language->get('text_settings'),
                'text_edit' => $this->language->get('text_edit'),
                'text_delete' => $this->language->get('text_delete'),
                'text_users' => $this->language->get('text_users'),
                'text_profile' => $this->language->get('text_profile'),
                'text_themes' => $this->language->get('text_themes'),
                'text_system' => $this->language->get('text_system'),
                'text_icon' => $this->language->get('text_icon'),
                'text_all_users_1' => $this->language->get('text_all_users_1'),
                'text_pagess' => $this->language->get('text_pagess'),
                'text_records' => $this->language->get('text_records'),
                'text_pages_load' => $this->language->get('text_pages_load'),
                'text_load_time' => $this->language->get('text_load_time'),
                'text_chenge' => $this->language->get('text_chenge'),
                'text_page_title' => $this->language->get('text_page_title'),
                'text_page_content' => $this->language->get('text_page_content'),
                'text_page_tegs' => $this->language->get('text_page_tegs'),
                'text_page_record' => $this->language->get('text_page_record'),
                'text_user_profile' => $this->language->get('text_user_profile'),
                'text_img' => $this->language->get('text_img'),
                'text_Login' => $this->language->get('text_Login'),
                'text_Email' => $this->language->get('text_Email'),
                'text_Surname' => $this->language->get('text_Surname'),
                'text_Name' => $this->language->get('text_Name'),
                'text_About' => $this->language->get('text_About'),
                'text_Role' => $this->language->get('text_Role'),
                'text_Skin_admins' => $this->language->get('text_Skin_admins'),
                'text_Password' => $this->language->get('text_Password'),
                
                'text_Blue' => $this->language->get('text_Blue'),
                'text_Red' => $this->language->get('text_Red'),
                'text_Yellow' => $this->language->get('text_Yellow'),
                'text_Green' => $this->language->get('text_Green'),
                'text_Purple' => $this->language->get('text_Purple'),
                'text_Russian' => $this->language->get('text_Russian'),
                'text_English' => $this->language->get('text_English'),
                'text_Ukrainian' => $this->language->get('text_Ukrainian'),
                'text_Demo' => $this->language->get('text_Demo'),
                'text_Administrator' => $this->language->get('text_Administrator'),
                'text_Update' => $this->language->get('text_Update'),
                'text_Characters' => $this->language->get('text_Characters'),
                'text_Add_User' => $this->language->get('text_Add_User'),
                'text_Login_Surename_Name' => $this->language->get('text_Login_Surename_Name'),
                
                'user_img' => $this->session->userdata('user_img'),
                'name' => $this->session->userdata('name'),
                'user_id' => $this->session->userdata('user_id'),
                'them_skin' => $this->session->userdata('them_skin'),
                'lang' => $this->session->userdata('lang'),
                'all_users' => $this->pages_model->count_all_user('users'),
                'all_pages' => $this->pages_model->count_all_user('pages')                
            );
            
            
            $this->parser->parse('header.tpl', $data);
            $this->parser->parse('home.tpl', $data);
            $this->parser->parse('footer.tpl', $data);
            
        }elseif(!isset($login)){  
            //$data['text_login'] = $this->language->get('text_login');
            $data = array(
                'error' => '',
                'text_name_lang' => $this->language->get('text_name_lang'),
                'text_lang' => $this->language->get('text_lang'),
                'text_login' => $this->language->get('text_login'),
                'text_remember_me' => $this->language->get('text_remember_me'),
                'text_sign_in' => $this->language->get('text_sign_in'),
                'text_forgot' => $this->language->get('text_forgot'),
            );
            $this->parser->parse('login.tpl', $data); 
            
        }elseif($data['username'] != $login or $data['password'] != $password){
            
            $data = array(
                'error' => '<div class="alert alert-danger alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><h4><i class="icon fa fa-ban"></i>'.$this->language->get('text_error').'</h4></div>',
                'text_name_lang' => $this->language->get('text_name_lang'),
                'text_lang' => $this->language->get('text_lang'),
                'text_login' => $this->language->get('text_login'),
                'text_remember_me' => $this->language->get('text_remember_me'),
                'text_sign_in' => $this->language->get('text_sign_in'),
                'text_forgot' => $this->language->get('text_forgot'),
            );
            $this->parser->parse('login.tpl', $data);  
        
        }elseif($data['username'] == $login and $data['password'] == $password) {
            $data = $this->main_lib->get_users($login, 'users');
            $session_id = $this->session->userdata('session_id');
            $newdata = array(
                'name' => $data['name'],
                'user_img' => $data['img'],
                'user_id' => $data['id'],
                'group_id' => $data['group_id'],
                'them_skin' => $data['them_skin'],
                'lang' => $data['language'],
                'logged_in' => TRUE,
                'KCFINDER' => Array('disabled' => TRUE)
            );
            
            $this->session->set_userdata($newdata);
            redirect(base_url().'admin');
         }        
	}
    
    function logoff()
    {
        $data = array(
            'title' => 'Авторизация',
            'error' => ''
        );
        $this->session->sess_destroy();  // обнуляем сессию
        redirect(base_url().'admin');
    }
    
    
    
    //forgot
    public function forgot()
	{
	       $data = array(
                'title' => 'Востановление'
            );
        $this->parser->parse('forgot.tpl', $data);    
    }
    
    public function set_language($lang)
	{
        $newdata = array('lang' => $lang);
        $this->session->set_userdata($newdata); 
        redirect($_SERVER["HTTP_REFERER"]);   
    }
    
    //Мой помочник иконки
    //После компиляции можно почистить (не забыть в видах из меню убрать)
    public function helpicon()
	{
	   
        if($this->session->userdata('logged_in') == '1'){
            $data = array(
                'title' => 'Иконки',
                'user_img' => $this->session->userdata('user_img'),
                'name' => $this->session->userdata('name'),
                'user_id' => $this->session->userdata('user_id'),
                'them_skin' => $this->session->userdata('them_skin'),
                'lang' => $this->session->userdata('lang'),
                'compani' => 'RAMStudio',
                'url' => 'http://moroz.rv.ua',
                'heading' => 'Страница из модуля админки - Welcome to CodeIgniter HMVC!'
            );
        $this->parser->parse('header.tpl', $data);
        $this->parser->parse('icons.tpl', $data);
        $this->parser->parse('footer.tpl', $data);    
        }else{
            $data = array(
                'error' => ''
            );
            redirect(base_url().'admin/');    
        }
		
	}
    
////// public function data()
//	{
//	   if($this->session->userdata('logged_in') == '1'){
//	       $data_header = array(
//            'title' => 'Страницы',
//            'user_img' => $this->session->userdata('user_img'),
//            'name' => $this->session->userdata('name'),
//            'user_id' => $this->session->userdata('user_id')
//        );
//        
//        $data = array(
//            'title' => 'Таблицы',
//            'user_img' => $this->session->userdata('user_img')
//        );
//        
//		$this->parser->parse('header.tpl', $data_header);
//        $this->parser->parse('data.tpl', $data);
//        $this->parser->parse('footer.tpl', $data);    
//	   }else{
//	       $data = array(
//                'error' => ''
//            );
//           redirect(base_url().'admin');
//	   }
//       
//	}
    
//    public function editor()
//	{
//	   
//        if($this->session->userdata('logged_in') == '1'){
//            $data = array(
//            'title' => 'Редактор',
//            'user_img' => $this->session->userdata('user_img'),
//            'name' => $this->session->userdata('name'),
//            'user_id' => $this->session->userdata('user_id'),
//            'compani' => 'RAMStudio',
//            'url' => 'http://moroz.rv.ua',
//            'heading' => 'Страница из модуля админки - Welcome to CodeIgniter HMVC!'
//        );  
//          
//    		$this->parser->parse('header.tpl', $data);
//            $this->parser->parse('editors.tpl', $data);
//            $this->parser->parse('footer.tpl', $data);
//        }else{
//            $data = array(
//                'error' => ''
//            );
//            redirect(base_url().'admin/');
//        }
//        
//	}
    
    //profile
    //public function profile()
	//{
	//     if($this->session->userdata('logged_in') == '1'){
    //        $data = array(
    //        'title' => 'Профиль',
    //        'user_img' => $this->session->userdata('user_img'),
    //        'user_id' => $this->session->userdata('user_id'),
    //        'name' => $this->session->userdata('name')
    //    );  
    //      
    //		$this->parser->parse('header.tpl', $data);
    //        $this->parser->parse('profile.tpl', $data);
    //        $this->parser->parse('footer.tpl', $data);
    //    }else{
    //        $data = array(
    //            'error' => ''
    //        );
    //        redirect(base_url().'admin/');
    //    }   
    //}	
    
}
