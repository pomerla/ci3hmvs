<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pages extends MX_Controller {

    function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library('common/main_lib');
        $this->load->model('pages_model');
        //обработка определения языка
        if(!isset($_SESSION["lang"])){
            $result = $this->db->select('*')->where('default', '1')->get('language')->row_array(); // выборка ленгвиж из таблицы настройки сайта
        }else{ 
            $result['language'] = $_SESSION["lang"]; 
        }
        $directory = 'modules/admin/language/'.$result['language']; // вместо language/russian дефолт ленгвиж из базы
        //
        //$this->load->library('common/language',$directory);
        //$this->language->load('common/login');
        
        //общая библиотека языка
        $this->lang->load($result['language'],$result['language']);
    }

	public function index()
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
        
            $data['pages'] = $this->pages_model->get_table('pages');
            
            $this->parser->parse('header.tpl', $data_header);
            $this->parser->parse('pages/data_pages.tpl', $data);
            $this->parser->parse('footer.tpl', $data);
            
        }else{  
            $data = array(
                'error' => ''
            );
            $this->parser->parse('login.tpl', $data); 
            
        }      
	}
    
    public function edit($id = FALSE)
	{
        if($this->session->userdata('logged_in') == '1'){
            $data_header = array(
                'title' => 'Страница ',
                'user_img' => $this->session->userdata('user_img'),
                'name' => $this->session->userdata('name'),
                'user_id' => $this->session->userdata('user_id'),
                'them_skin' => $this->session->userdata('them_skin'),
                'lang' => $this->session->userdata('lang')
            );
            
            if ($id === FALSE)
            {
                redirect(base_url().'admin/users');
            }
        
            $data = $this->pages_model->get_page($id);
            
            $this->parser->parse('header.tpl', $data_header);
            $this->parser->parse('pages/edit_pages.tpl', $data);
            $this->parser->parse('footer.tpl', $data);
            
        }else{  
            $data = array(
                'error' => ''
            );
            $this->parser->parse('login.tpl', $data); 
            
        }      
	}
    
    public function add()
	{
	   
        if($this->session->userdata('logged_in') == '1'){
            $data_header = array(
                'title' => 'Добавить страницу',
                'user_img' => $this->session->userdata('user_img'),
                'name' => $this->session->userdata('name'),
                'user_id' => $this->session->userdata('user_id'),
                'them_skin' => $this->session->userdata('them_skin'),
                'lang' => $this->session->userdata('lang')
            );  
            
            if(isset($_POST['add'])){
                
                $this->form_validation->set_rules($this->main_lib->add_rules);
                $check = $this->form_validation->run();
                
                
                if ($check == FALSE)
                {
                    $this->parser->parse('header.tpl', $data_header);
                    $this->parser->parse('pages/add_page.tpl', $data);
                    $this->parser->parse('footer.tpl', $data);
                }
                else
                {
                    $pages_in_base = $this->db->count_all('pages');
                    $add['title'] = $this->input->post('title');
                    $add['text'] = $this->input->post('text');
                    $add['description'] = $this->input->post('description');
                    $add['keywords'] = $this->input->post('keywords');
                    $add['tags'] = $this->input->post('tags');
                    $add['uri'] = $this->input->post('uri');
                    $add['sort'] = $pages_in_base+1;
                    $this->db->insert('pages',$add);
                    redirect(base_url().'admin/pages');
                }
                
            }else{
          
        		$this->parser->parse('header.tpl', $data_header);
                $this->parser->parse('pages/add_page.tpl', $data_header);
                $this->parser->parse('footer.tpl', $data_header);
            }
        }else{
            $data = array(
                'error' => ''
            );
            redirect(base_url().'admin/');
        }
        
	}
    
    //update
    public function update()
	{
	   
        if($this->session->userdata('logged_in') == '1'){
            $data_header = array(
                'title' => 'Изменить страницу',
                'user_img' => $this->session->userdata('user_img'),
                'name' => $this->session->userdata('name'),
                'user_id' => $this->session->userdata('user_id')
            );  
            
            if(isset($_POST['update'])){
                
                $this->form_validation->set_rules($this->main_lib->add_rules);
                $check = $this->form_validation->run();
                
                
                if ($check == FALSE)
                {
                    $pages_id = $this->input->post('id');
                    $data = $this->pages_model->get_page($pages_id);
                    $this->parser->parse('header.tpl', $data_header);
                    $this->parser->parse('pages/edit_pages.tpl', $data);
                    $this->parser->parse('footer.tpl', $data);
                }
                else
                {
                    $pages_id = $this->input->post('id');
                    $update['title'] = $this->input->post('title');
                    $update['text'] = $this->input->post('text');
                    $update['description'] = $this->input->post('description');
                    $update['keywords'] = $this->input->post('keywords');
                    $update['tags'] = $this->input->post('tags');
                    $update['uri'] = $this->input->post('uri');
                    
                    $this->db->where('id',$pages_id);  
                    $this->db->update('pages',$update);
                    redirect(base_url().'admin/pages');
                }
                
            }else{
          
        		$this->parser->parse('header.tpl', $data_header);
                $this->parser->parse('pages/edit_pages.tpl', $data);
                $this->parser->parse('footer.tpl', $data);
            }
        }else{
            $data = array(
                'error' => ''
            );
            redirect(base_url().'admin/');
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
                redirect(base_url().'admin/pages');
            }
        
            $this->db->where('id', $id);
            $this->db->delete('pages');
            
            $data['pages'] = $this->pages_model->get_table('pages');
            $this->parser->parse('header.tpl', $data_header);
            $this->parser->parse('pages/data_pages.tpl', $data);
            $this->parser->parse('footer.tpl', $data);
            
        }else{  
            $data = array(
                'error' => ''
            );
            $this->parser->parse('login.tpl', $data); 
            
        }      
	}
	
    
}
