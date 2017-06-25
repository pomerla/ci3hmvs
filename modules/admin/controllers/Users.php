<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Users extends MX_Controller {

    function __construct()
    {
        parent::__construct();
        $this->load->database();
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
        
        $this->load->model('users_model');
        //общая библиотека языка
        $this->lang->load($result['language'],$result['language']);
    }

	public function index()
	{
        if($this->session->userdata('logged_in') == '1'){
            $data_header = array(
                'title' => 'Пользователи',
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
                'user_img' => $this->session->userdata('user_img'),
                'name' => $this->session->userdata('name'),
                'user_id' => $this->session->userdata('user_id'),
                'them_skin' => $this->session->userdata('them_skin'),
                'lang' => $this->session->userdata('lang')
            );
        
            $data['users'] = $this->users_model->get_table('users');
            
            $this->parser->parse('header.tpl', $data_header);
            $this->parser->parse('users/data_users.tpl', $data);
            $this->parser->parse('footer.tpl', $data);
            
        }else{  
            $data = array(
                'error' => ''
            );
            $this->parser->parse('login.tpl', $data); 
            
        }      
	}
    
    public function edit($post = FALSE)
	{
        if($this->session->userdata('logged_in') == '1'){
            $data_header = array(
                'title' => 'Пользователи',
                'user_img' => $this->session->userdata('user_img'),
                'name' => $this->session->userdata('name'),
                'user_id' => $this->session->userdata('user_id'),
                'them_skin' => $this->session->userdata('them_skin'),
                'lang' => $this->session->userdata('lang')
            );
            
            if ($post === FALSE)
            {
                redirect(base_url().'admin/users');
            }
        
            //$data = $this->users_model->get_user($id);
            //                          (where 'id' = $post in table users)
            $data = $this->main_lib->get_row('id',$post,'users');
            
            $this->parser->parse('header.tpl', $data_header);
            $this->parser->parse('users/edit_users.tpl', $data);
            $this->parser->parse('footer.tpl', $data);
            
        }else{  
            $data = array(
                'error' => ''
            );
            $this->parser->parse('login.tpl', $data); 
            
        }      
	}
    
    //add
    public function add()
	{
        if($this->session->userdata('logged_in') == '1'){
            $data_header = array(
                'title' => 'Пользователи',
                'user_img' => $this->session->userdata('user_img'),
                'name' => $this->session->userdata('name'),
                'user_id' => $this->session->userdata('user_id'),
                'them_skin' => $this->session->userdata('them_skin'),
                'lang' => $this->session->userdata('lang')
            );
            $data = array(
                'title' => 'Пользователи'
            );
            
            //                          (where 'id' = $post in table users)
            //$data = $this->main_lib->get_row('id',$post,'users');
            
            if(isset($_POST['add'])){
                
                $this->form_validation->set_rules($this->main_lib->add_rules_user);
                $check = $this->form_validation->run();
                
                
                
                
                if ($check == FALSE)
                {
                    $this->parser->parse('header.tpl', $data_header);
                    $this->parser->parse('users/add_users.tpl', $data);
                    $this->parser->parse('footer.tpl', $data);
                }
                else
                {
                    $pages_in_base = $this->db->count_all('users');
                    $add['username'] = $this->input->post('username');
                    $add['group_id'] = $this->input->post('group_id');
                    $add['password'] = md5($this->input->post('password'));
                    $add['email'] = $this->input->post('email');
                    $add['surname'] = $this->input->post('surname');
                    $add['name'] = $this->input->post('name');
                    $add['about_me'] = $this->input->post('about_me');
                    $update['language'] = $this->input->post('language');
                    $update['them_skin'] = $this->input->post('them_skin');
                    $u_img = $this->input->post('img');
                    if($u_img != ''){
                        $add['img'] = $this->input->post('img');
                    }
                    
                    $add['id'] = $pages_in_base+1;
                    
                    $post_user = $this->input->post('username'); // проверка юзера в базе
                    $check_user = $this->main_lib->get_row('username',$post_user,'users'); //проверка юзера в базе
                    if(isset($check_user)){ //проверка юзера в базе
                        $data = Array('error_name' => '<div style="height: 35px;line-height: 35px;padding-left: 10px;" class="bg-red-active color-palette"><span>Такой пользователь уже есть</span></div>');
                        $this->parser->parse('header.tpl', $data_header);
                        $this->parser->parse('users/add_users.tpl', $data);
                        $this->parser->parse('footer.tpl', $data);
                    
                    }else{//проверка юзера в базе
                    $this->db->insert('users',$add);
                    redirect(base_url().'admin/users');
                    }
                }
                
            }else{
        		$this->parser->parse('header.tpl', $data_header);
                $this->parser->parse('users/add_users.tpl', $data);
                $this->parser->parse('footer.tpl', $data);
            }
             
        }else{  
            $data = array(
                'error' => ''
            );
            $this->parser->parse('login.tpl', $data); 
            
        }      
	}
    
    
    public function remove($id = FALSE)
	{
        if($this->session->userdata('logged_in') == '1'){
            $data_header = array(
                'title' => 'Страница ',
                'user_img' => $this->session->userdata('user_img'),
                'name' => $this->session->userdata('name'),
                'user_id' => $this->session->userdata('user_id')
            );
            
            if ($id === FALSE)
            {
                redirect(base_url().'admin/users');
            }
        
            $this->db->where('id', $id);
            $this->db->delete('users');
            
            $data['users'] = $this->users_model->get_table('users');
            $this->parser->parse('header.tpl', $data_header);
            $this->parser->parse('users/data_users.tpl', $data);
            $this->parser->parse('footer.tpl', $data);
            
        }else{  
            $data = array(
                'error' => ''
            );
            $this->parser->parse('login.tpl', $data); 
            
        }      
	}
    
    
    //update
    public function update()
	{
	   
        if($this->session->userdata('logged_in') == '1'){
            $data_header = array(
                'title' => 'Изменить пользоателя',
                'user_img' => $this->session->userdata('user_img'),
                'name' => $this->session->userdata('name'),
                'user_id' => $this->session->userdata('user_id')
            );  
            
            if(isset($_POST['update'])){
                
                $this->form_validation->set_rules($this->main_lib->edit_rules_user);
                $check = $this->form_validation->run();
                
                
                if ($check == FALSE)
                {
                    //$user_id = $this->input->post('id');
                    //$data = $this->pages_model->get_page($user_id);
                    $data = array(
                        'titles' => 'Изменить пользоателя'
                    );
                    //$pages_id = $this->input->post('id');
                    
                    $post = $this->input->post('id');
                    //$data = $this->pages_model->get_page($pages_id);
                    $data = $this->main_lib->get_row('id',$post,'users');
                    
                    $this->parser->parse('header.tpl', $data_header);
                    $this->parser->parse('users/edit_users.tpl', $data);
                    $this->parser->parse('footer.tpl', $data);
                }
                else
                {
                    $pages_id = $this->input->post('id');
                    //$update['username'] = $this->input->post('username');
                    $update['email'] = $this->input->post('email');
                    $update['surname'] = $this->input->post('surname');
                    $update['name'] = $this->input->post('name');
                    $update['about_me'] = $this->input->post('about_me');
                    $update['group_id'] = $this->input->post('group_id');
                    $update['img'] = $this->input->post('img');
                    
                    $update['language'] = $this->input->post('language');
                    $update['them_skin'] = $this->input->post('them_skin');
                    
                    if($this->input->post('password') != ''){
                        $password = md5($this->input->post('password'));
                        $update['password'] = $password;
                    }
                    
                    //$add['id'] = $pages_in_base+1;
                    
                    $this->db->where('id',$pages_id);  
                    $this->db->update('users',$update);
                    redirect(base_url().'admin/users');
                }
                
            }else{
          
        		$this->parser->parse('header.tpl', $data_header);
                $this->parser->parse('users/edit_users.tpl', $data);
                $this->parser->parse('footer.tpl', $data);
            }
        }else{
            $data = array(
                'error' => ''
            );
            redirect(base_url().'admin/');
        }
        
	}
    
    
    
    //update
    public function count_user($permiss = NULL)
	{
	   
        if($this->session->userdata('logged_in') == '1'){
            $data_header = array(
                'title' => 'Изменить пользоателя',
                'user_img' => $this->session->userdata('user_img'),
                'name' => $this->session->userdata('name'),
                'user_id' => $this->session->userdata('user_id')
            );  
            
            
            $data = $this->users_model->count_user('users',$permiss);
            echo $data;
            
        }else{
            $data = array(
                'error' => ''
            );
            redirect(base_url().'admin/');
        }
        
	}
    
   
	
    
}
