<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Frontend extends MX_Controller {

    function __construct()
    {
        parent::__construct();
        
        $this->load->library('common/main_lib');
        $seg = $this->uri->segment(2);
        if ($seg!="install" && $seg!= "install_action") {
            if (file_exists('install.txt')) {
                redirect(base_url('install/install'), 'location');
            }
        }
        $this->load->database();
    }
    
    public function index()
	{
        $this->load->library('gravatar');
        $email = 'aleksmorro@gmail.com';
        $gravatar_url = $this->gravatar->get($email);
        
	    $data = array(
            'title' => 'Первая страница из шаблона',
            'name' => 'Александр Мороз',
            'compani' => 'RAMStudios',
            'gavatar' => $gravatar_url,
            'url' => 'http://moroz.rv.ua',
            'heading' => 'Страница из шаблона тем - Welcome to CodeIgniter HMVC!'
        );
		$this->load->view('welcome_message_hmvc', $data);
	}
    
    public function hmvc()
    {
        $data = array(
            'title' => 'Первая страница из шаблона',
            'name' => 'Александр Мороз',
            'compani' => 'RAMStudio',
            'url' => 'http://moroz.rv.ua',
            'heading' => 'Страница из модуля welcome - Welcome to CodeIgniter HMVC!'
        );
        $this->load->view('welcome_message', $data);
    }
    
    public function parse()
    {
        $this->load->library('parser');
        $data = array(
            'title' => 'Первая страница из шаблона',
            'name' => 'Александр Мороз',
            'compani' => 'RAMStudio',
            'url' => 'http://moroz.rv.ua',
            'heading' => 'Страница из шаблона тем (шаблон acme)- Welcome to CodeIgniter HMVC!'
        );
        
        $this->parser->parse(DIR_THEMS.'/welcome_message_header.tpl', $data);
        $this->parser->parse(DIR_THEMS.'/welcome_message_tpl.tpl', $data);
    }
    
}
