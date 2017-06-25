<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Install extends MX_Controller {

    function __construct()
    {
        parent::__construct();
        
        if(!isset($_SESSION["lang"])){
            $result['language'] = "english";  // выборка ленгвиж из таблицы настройки сайта
        }else{ 
            $result['language'] = $_SESSION["lang"]; 
        }
        //подт€гиваем €зык с модул€
        $this->lang->load('install/install', $result['language']);
        
        $seg = $this->uri->segment(2);
        if ($seg!="install" && $seg!= "install_action") {
            if (file_exists('install.txt')) {
                redirect(base_url('install/install'), 'location');
            }
        }
        
    }

	public function index()
    {
        include './config.php';
        if (!file_exists('install.txt')) {
            redirect(base_url('admin'), 'location');
        }
        $data = array("body" => "page/install", "page_title" => "Install Package");
        $this->load->view('install', $data);
    }
    
    public function install()
    {
        include './config.php';
        if (!file_exists('install.txt')) {
            redirect(base_url('admin'), 'location');
        }
        $data = array("body" => "page/install", "page_title" => "Install Package");
        $this->load->view('install', $data);
    }
    
    public function install_action()
    {
        if (!file_exists('install.txt')) {
            redirect(base_url('admin'), 'location');
        }

        if ($_POST) {
            // validation
            $this->form_validation->set_rules('host_name',               '<b>Host Name</b>',                   'trim|required');
            $this->form_validation->set_rules('database_name',           '<b>Database Name</b>',               'trim|required');
            $this->form_validation->set_rules('database_username',       '<b>Database Username</b>',           'trim|required');
            $this->form_validation->set_rules('database_password',       '<b>Database Password</b>',           'trim');
            $this->form_validation->set_rules('app_username',            '<b>Admin Panel Login Email</b>',     'trim|required');
            $this->form_validation->set_rules('app_password',            '<b>Admin Panel Login Password</b>',  'trim|required');
            $this->form_validation->set_rules('institute_name',          '<b>Company Name</b>',                'trim');
            $this->form_validation->set_rules('institute_address',       '<b>Company Address</b>',             'trim');
            $this->form_validation->set_rules('institute_mobile',        '<b>Company Phone / Mobile</b>',      'trim');
            $this->form_validation->set_rules('language',                '<b>Language</b>',                    'trim');

            // go to config form page if validation wrong
            if ($this->form_validation->run() == false) {
                return $this->install();
            } else {
                $host_name = addslashes(strip_tags($this->input->post('host_name', true)));
                $database_name = addslashes(strip_tags($this->input->post('database_name', true)));
                $database_username = addslashes(strip_tags($this->input->post('database_username', true)));
                $database_password = addslashes(strip_tags($this->input->post('database_password', true)));
                $app_username = addslashes(strip_tags($this->input->post('app_username', true)));
                $app_password = addslashes(strip_tags($this->input->post('app_password', true)));
                $institute_name = addslashes(strip_tags($this->input->post('institute_name', true)));
                $institute_address = addslashes(strip_tags($this->input->post('institute_address', true)));
                $institute_mobile = addslashes(strip_tags($this->input->post('institute_mobile', true)));
                $language = addslashes(strip_tags($this->input->post('language', true)));

                $con=@mysqli_connect($host_name, $database_username, $database_password);
                if (!$con) {
                    $this->session->set_userdata('mysql_error', "Could not conenect to MySQL.");
                    return $this->install();
                }
                if (!@mysqli_select_db($con,$database_name)) {
                    $this->session->set_userdata('mysql_error', "Database not found.");
                    return $this->install();
                }
                mysqli_close($con);

                 // writing application/config/my_config
                //$app_my_config_data = "<?php ";
                //$app_my_config_data.= "\$config['product_name'] = 'DTMS - Demo Templates Management System';\n";
                //$app_my_config_data.= "\$config['product_short_name'] = 'DTMS';\n";
                //$app_my_config_data.= "\$config['product_version'] = '1.0 ';\n\n";
                //$app_my_config_data.= "\$config['developed_by'] = 'RAMSTUDIO';\n";
                //$app_my_config_data.= "\$config['developed_by_href'] = 'http://moroz.rv.ua/';\n";
                //$app_my_config_data.= "\$config['developed_by_title'] = 'RAMSTUDIO';\n";
                //$app_my_config_data.= "\$config['support_email'] = 'pomerla@mail.ru' ;\n";
                //file_put_contents(APPPATH.'config/my_config.php', $app_my_config_data, LOCK_EX);
                  //writting  application/config/my_config

                  //writting application/config/database
                $database_data = "";
$database_data.= "<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');\n

// TEMS
define('DIR_THEMS', 'acme');
define('CMS_NAME', 'THOTH');
define('CMS_SHORT_NAME', 'TH');
define('CMS_VERSION', '2.0');
define('CMS_DEV', 'RAMstudio'); 
define('CMS_DEV_URL', 'http://moroz.rv.ua/');
define('ADMIN_DIR', 'admins');//not ready


// DB
define('DB_DBDRIVER', 'mysqli');
define('DB_HOSTNAME', '$host_name');
define('DB_USERNAME', '$database_username');
define('DB_PASSWORD', '$database_password');
define('DB_DATABASE', '$database_name');
define('DB_DBPREFIX', '');

?>";
file_put_contents('config.php', $database_data, LOCK_EX);
                  //writting application/config/database

$home_url = implode('', array_slice(explode('/', $_SERVER['PHP_SELF']), 0, -1));
$htaccess_data.= "\n
AddDefaultCharset UTF-8
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /$home_url
    RewriteCond %{REQUEST_URI} ^system.*
    RewriteRule ^(.*)$ /index.php?/$1 [L]
    RewriteCond %{REQUEST_URI} ^application.*
    RewriteRule ^(.*)$ /index.php?/$1 [L]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule ^(.*)$ index.php?/$1 [L]
</IfModule>

<IfModule !mod_rewrite.c>
    ErrorDocument 404 /index.php
</IfModule>
";
file_put_contents('.htaccess', $htaccess_data, LOCK_EX);


                  // loding database library, because we need to run queries below and configs are already written

                $this->load->database();
                $this->load->model('basic');
                  // loding database library, because we need to run queries below and configs are already written

                  // dumping sql
                $dump_file_name = 'initial_db.sql';
                $dump_sql_path = 'assets/backup_db/'.$dump_file_name;
                $this->basic->import_dump($dump_sql_path);
                  // dumping sql

                  //generating hash password for admin and updaing database
                $app_password = md5($app_password);
                $this->basic->update_data($table = "users", $where = array("id" => "1"), $update_data = array("username" => $app_username, "password" => $app_password));
                  //generating hash password for admin and updaing database

                  //deleting the install.txt file,because installation is complete
                  if (file_exists('install.txt')) {
                      unlink('install.txt');
                  }
                  //deleting the install.txt file,because installation is complete
                  redirect(base_url('install/installcomplite'));
            }
        }
    }
    
    public function installcomplite()
    {
        $data = array("body" => "installcomplite", "page_title" => "text_Installation_Completed");
        $this->load->view('installcomplite', $data);
    }
   
}
