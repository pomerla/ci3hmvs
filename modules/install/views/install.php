<?php
if(!isset($_SESSION)){session_start();} 
      if(isset($_GET['lang']) && $_GET['lang']=="ru") {
      $_SESSION['lang']='russian'; 
        if($_SERVER['REQUEST_METHOD']==="GET"){header("Location: " . $_SERVER['REQUEST_URI'] . "?");}
      }
      if(isset($_GET['lang']) && $_GET['lang']=="ua") {
      $_SESSION['lang']='ukrainian';
        if($_SERVER['REQUEST_METHOD']==="GET"){header("Location: " . $_SERVER['REQUEST_URI'] . "?");}
      }
      if(isset($_GET['lang']) && $_GET['lang']=="en") {
      $_SESSION['lang']='english';
        if($_SERVER['REQUEST_METHOD']==="GET"){header("Location: " . $_SERVER['REQUEST_URI'] . "?");}
      }
?>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Install Package</title>	
    <!-- core CSS -->
<link href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css')?>" rel="stylesheet" />
<link href="<?php echo base_url('assets/bootstrap-datepicker/css/bootstrap-datepicker3.min.css')?>" rel="stylesheet" />
<link href="<?php echo base_url('assets/css/font-awesome.min.css')?>" rel="stylesheet" />
<link href="<?php echo base_url('assets/css/animate.min.css')?>" rel="stylesheet" />
<link href="<?php echo base_url('assets/css/main.css')?>" rel="stylesheet" />
<link href="<?php echo base_url('assets/css/custom.css')?>" rel="stylesheet" />    
 
<!-- for RTL support -->
<script type="text/javascript" src="<?php echo base_url('assets/js/jquery-1.11.1.min.js')?>"></script>
<!-- end of for modal effect  <?php echo base_url('')?> -->
<script type="text/javascript" src="<?php echo base_url('sitedoc/assets/js/bootstrap.min.js')?>"></script>

<link id="page_favicon" href="<?php echo base_url('assets/css/appicon.png')?>" rel="icon" type="image/x-icon" />   
<style>
.alert {
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid transparent;
    border-radius: 4px;
}
</style>

</head>

<?php 
  /*****Curl******/
  $curl="Can't Checked";
  $mbstring="Can't Checked";
  $safe_mode="Can't Checked";
  $open_basedir="Can't Checked";
  $allow_url_fopen="Can't Checked";
  
  $mysql_support="";
  $install_allow = 1;

  if(function_exists('curl_version'))
    $curl="<div class='alert alert-success'><i class='fa fa-check-circle'></i> <b>curl : </b>". lang('text_enabled') ."</div>";
  else{
    $install_allow = 0;
    $curl="<div class='alert alert-danger'><i class='fa fa-times-circle'></i> <b>curl : </b>". lang('text_CurlError') ."</div>";
  }
  
  if(function_exists( "mb_detect_encoding" ) )
    $mbstring="<div class='alert alert-success'><i class='fa fa-check-circle'></i> <b>mbstring : </b>". lang('text_enabled') ."</div>";
  else{
    $install_allow = 0;
    $mbstring="<div class='alert alert-danger'><i class='fa fa-times-circle'></i> <b>mbstring : </b>". lang('text_MbstringError') ."</div>";
  }
    
    
  if(function_exists('ini_get')){
    if( ini_get('safe_mode') ){
      $install_allow = 0;
      $safe_mode="<div class='alert alert-danger'><i class='fa fa-times-circle'></i> <b>safe mode : </b>". lang('text_SafeMode') ."</div>";
    }
    else
      $safe_mode="<div class='alert alert-xs alert-success'><i class='fa fa-check-circle'></i> <b>safe mode : </b>OK</div>";
      
    if(ini_get('open_basedir')=="")
      $open_basedir="<div class='alert alert-success'><i class='fa fa-check-circle'></i> <b>open basedir : </b>Ok. </div>";
    else{
      $install_allow = 0;
      $open_basedir="<div class='alert alert-danger'><i class='fa fa-times-circle'></i> <b>open basedir : </b>". lang('text_OpenBasedir') ."</div>";
    }
    
    if(ini_get('allow_url_fopen'))
      $allow_url_fopen="<div class='alert alert-success'><i class='fa fa-check-circle'></i> <b>allow url open : </b>". lang('text_enabled') ."</div>";
    else{
      $install_allow = 0;
      $allow_url_fopen="<div class='alert alert-danger'><i class='fa fa-times-circle'></i> <b>allow url open : </b>". lang('text_Allow_Url_Fopen') ."</div>";
    }
    
  }
  
  if(function_exists('mysqli_connect'))
    $mysqli_support="<div class='alert alert-success'><i class='fa fa-check-circle'></i> <b>mysql support : </b>". lang('text_supported') ."</div>";
  else{
    $install_allow = 0;
    $mysqli_support="<div class='alert alert-danger'><i class='fa fa-times-circle'></i> <b>mysql support : </b>". lang('text_MysqlSupport') ."</div>";
  }
?>
<div class="container" id="LG">
	<div class="row">
		<div class="span12">
            <div class="span3">
<script language ="JavaScript"> 
<!-- 
function paramChange() { 
  document.form.submit();
} 
-->
</script> 
                <form action="" name="myForm" method="get">
                    <select onchange="document.forms['myForm'].submit()" id="selectbasic" name="lang" class="form-control"> 
                        <option selected="en"><?= lang('text_lang') ?></option>
                        <option value="en">English</option> 
                        <option value="ru">Русский</option>
                        <option value="ua">Українська</option>
                    </select>
                 </form>   
            </div>

  <div class="row" style="padding-left:15px;padding-right:15px;">  
   
    <div class="col-sm-12 col-xs-12 col-md-7 col-lg-7 border_gray grid_content padded background_white">
    <h6 class="column-title"><i class="fa fa-cog fa-2x blue"> <?= lang('text_install') ?> <?php echo CMS_NAME ?></i></h6>
    
    <?php 
    if($this->session->userdata('mysql_error')!="")
      {
        echo "<pre style='margin:0 auto;color:red;text-align:center;'><h3 style='color:red;'>";
        echo $this->session->userdata('mysql_error');
        $this->session->unset_userdata('mysql_error');
        echo "</h3></pre><br/>"; 
      }
    ?>

    <?php 
      if(validation_errors())
      {
        echo "<pre style='margin:0 auto;color:red;text-align:center;'>";
        print_r(validation_errors()); 
        echo "</pre><br/>"; 
      }
    ?>
    <div class="account-wall" id='recovery_form' style='text-align:left; padding:0 15px;'> 
      <form class="form-horizontal" action="<?php echo base_url('install/install_action')?>" method="POST">
        <div class="form-group">
           <label><?= lang('text_HostName') ?></label>
           <input type="text" value="localhost" name="host_name" required class="form-control col-xs-12"  placeholder="<?= lang('text_HostName') ?>" />          
        </div>
        <div class="form-group">
           <label><?= lang('text_DatabaseName') ?></label>
           <input type="text" value="" name="database_name" required class="form-control col-xs-12"  placeholder="<?= lang('text_DatabaseName') ?>" />          
        </div>
        
        <div class="form-group">
           <label><?= lang('text_DatabaseUsername') ?></label>
           <input type="text" value="" name="database_username" required class="form-control col-xs-12"  placeholder="<?= lang('text_DatabaseUsername') ?>" />          
        </div>
        <div class="form-group">
           <label><?= lang('text_DatabasePassword') ?></label>
           <input type="password" name="database_password" class="form-control col-xs-12"  placeholder="<?= lang('text_DatabasePassword') ?>" />          
        </div>

         <div class="form-group">
           <label><?= lang('text_AdminPanelLogin') ?></label>
           <input type="text" value="" name="app_username" required class="form-control col-xs-12"  placeholder="<?= lang('text_AdminPanelLogin') ?>" />          
        </div>
        <div class="form-group">
           <label><?= lang('text_AdminPanelLoginPassword') ?></label>
           <input type="password" name="app_password" required class="form-control col-xs-12"  placeholder="<?= lang('text_AdminPanelLoginPassword') ?>" />          
        </div>

         

   
        <!--<div class="form-group">
           <label>Company Name </label>
           <input type="text" value="" name="institute_name" class="form-control col-xs-12"  placeholder="Company Name">          
        </div>
        <div class="form-group">
           <label>Company Address </label>
           <input type="text" value="" name="institute_address" class="form-control col-xs-12"  placeholder="Company Address">          
        </div>
        <div class="form-group">
           <label>Company Phone / Mobile </label>
           <input type="text" value="" name="institute_mobile" class="form-control col-xs-12"  placeholder="Company Phone / Mobile">          
        </div> -->  

       
        <div class="form-group text-center">
          <button type="submit" style="margin-top:20px" class="btn btn-warning btn-lg" <?php if($install_allow == 0) echo "disabled"; ?> ><i class="fa fa-check"></i><?= lang('text_Install_Now') ?> </button><br/><br/> 
        </div>  
      </form>    
    </div>
  </div>


  <div class="col-sm-12 col-xs-12 col-md-5 col-lg-5 border_gray grid_content padded background_white alert alert-warning">
      <h6 class="column-title"><i class="fa fa-cog fa-2x blue"> <?= lang('text_Server_Requirements') ?></i></h6>
      <?php
      echo $curl;
      echo $mbstring;
      echo $safe_mode;
      echo $open_basedir;
      echo $allow_url_fopen;
      echo $mysqli_support;
      ?>
      <div class="alert alert-warning">
        <p><?= lang('text_make_following') ?></p>
        <p>
          <ul>
            <li>Folder : application/config (777)</li>
            <li>Folder : application/core (777)</li>
            <li>Folder : download (777)</li>
            <li>File : install.txt (777)</li>
          </ul>
        </p>
      </div>
      <?php if($install_allow==1) :?>
        <div class="alert alert-info text-center"><b><?= lang('text_congratulation') ?></b></div>
      <?php else : ?>
        <div class="alert alert-danger text-center"><b>Warning ! Please fullfill the above requirements (red colored) first.</b></div>
      <?php endif; ?>
    </div>
  </div>


</div>
	</div>
</div>