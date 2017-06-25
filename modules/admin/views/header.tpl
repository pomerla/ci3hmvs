<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>{title} - Admin <?php echo CMS_NAME ?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<?php echo base_url('modules/admin/views/bootstrap/css'); ?>/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="<?php echo base_url('modules/admin/views/plugins/datatables'); ?>/dataTables.bootstrap.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="<?php echo base_url('modules/admin/views/plugins/datepicker'); ?>/datepicker3.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo base_url('modules/admin/views/dist/css'); ?>/AdminLTE.min.css">
  <link rel="stylesheet" href="<?php echo base_url('modules/admin/views/dist/css/skins'); ?>/_all-skins.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
  <link rel="stylesheet" href="<?php echo base_url('modules/admin/views/dist/css/skins'); ?>/skin-blue.min.css">
  <link rel="stylesheet" href="<?php echo base_url('modules/admin/views/plugins/iCheck/flat'); ?>/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <style>
#page-preloader {
  background-color:#FFFFFF;
  background-position:center center;
  background-repeat:no-repeat;
  height:100%;
  left:0;
  position:fixed;
  top: 0;
  width:100%;
  z-index:999999;
}

#page-preloader .spinner {
    width: 300px;
    height: 300px;
    position: absolute;
    left:40%;
    top: 10%;
    background: url('<?php echo base_url(); ?>modules/admin/views/dist/img/preloader.gif') no-repeat 50% 50%;
    margin: -16px 0 0 -16px;
}
</style>
<!--
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
$(window).on('load', function () {
    var $preloader = $('#page-preloader'),
        $spinner   = $preloader.find('.spinner');
    $spinner.fadeOut();
    $preloader.delay(350).fadeOut('slow');
});
</script>

</head>

<body class="hold-transition skin-{them_skin} sidebar-mini">


<div id="page-preloader"><span class="spinner"></span></div>
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="<?php echo base_url(); ?>admin" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><i class="fa fa-home"></i></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b><?php echo CMS_SHORT_NAME ?> </b>Admin
      
      
      </span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          

          <!-- Notifications Menu -->
        
          <!-- Tasks Menu -->
          <li class="dropdown tasks-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-globe"></i>
              <span> <?= lang('text_language') ?></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="<?php echo base_url(); ?>admin/set_language/english"><?= lang('text_English') ?></a></li>
                <li><a href="<?php echo base_url(); ?>admin/set_language/russian"><?= lang('text_Russian') ?></a></li>
                <li><a href="<?php echo base_url(); ?>admin/set_language/ukrainian"><?= lang('text_Ukrainian') ?></a></li>
              
            </ul>
            <li class="footer"></li>
          </li>
          
          <li><a href="../" target="_blank" title="<?= lang('text_home_site') ?>"><i class="fa fa-life-ring"></i></a></li>
          
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <img src="{user_img}" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs">{name}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="{user_img}" class="img-circle" alt="User Image">

                <p>
                  {name}
                  <!--<small>Member since Nov. 2012</small>-->
                </p>
              </li>
              
              <li class="user-footer">
                <div class="pull-left">
                  <a href="<?php echo base_url(); ?>admin/users/edit/{user_id}" class="btn btn-default btn-flat"><?= lang('text_profile') ?></a>
                </div>
                <div class="pull-right">
                  <a href="<?php echo base_url(); ?>admin/logoff" class="btn btn-default btn-flat"><?= lang('text_exit') ?></a>
                </div>
              </li>
            </ul>
          </li>
          
          <!--<li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>-->
          
        </ul>
      </div>
    </nav>
  </header>
   
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="{user_img}" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>{name}</p>
          <!-- Status -->
          <a href="<?php echo base_url(); ?>admin/logoff"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- search form (Optional) 
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>-->
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu">
        <li class="treeview">
          <a href="#"><i class="fa fa-university"></i> <span><?= lang('text_pages') ?></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu"
            <?php echo (strcmp($this->uri->segment(2),'pages')==0)?'style="display: block;"':''; ?>    
          >
            <li><a href="<?php echo base_url(); ?>admin/pages"><i class="fa fa-file-text"></i> <?= lang('text_pages_view') ?></a></li>
            <li><a href="<?php echo base_url(); ?>admin/pages/add"><i class="fa fa-plus-square"></i> <?= lang('text_pages_add') ?></a></li>
          </ul>
        </li>
        
        <li class="treeview">
          <a href="#"><i class="fa fa-photo"></i> <span><?= lang('text_files') ?></span></a>
        </li>
        
        <!-- Optionally, you can add icons to the links -->
        <li class="treeview">
          <a href="#"><i class="fa fa-puzzle-piece"></i> <span><?= lang('text_plugins') ?></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?php echo base_url(); ?>admin/data"><i class="fa fa-list"></i> <?= lang('text_plugins') ?></a></li>
            <li><a href="<?php echo base_url(); ?>admin/editor"><i class="fa fa-plus-square"></i> <?= lang('text_add_plugins') ?></a></li>
          </ul>
        </li>
        
        <!-- <li><a href="/admin/editor"><i class="fa fa-edit"></i> <span> Editor</span></a></li> -->
        
        <li class="treeview">
          <a href="#"><i class="fa fa-cogs"></i> <span><?= lang('text_settings') ?></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu"
            <?php echo (strcmp($this->uri->segment(2),'helpicon')==0)?'style="display: block;"':''; ?>    
            <?php echo (strcmp($this->uri->segment(2),'users')==0)?'style="display: block;"':''; ?>
          >
            <li><a href="<?php echo base_url(); ?>admin/helpicon"><i class="fa fa-link"></i><?= lang('text_icon') ?></a></li>
            <li><a href="<?php echo base_url(); ?>admin/users"><i class="fa fa-users"></i> <?= lang('text_users') ?></a></li>
            <li><a href="<?php echo base_url(); ?>admin/users/edit/{user_id}"><i class="fa fa-user"></i> <?= lang('text_profile') ?></a></li>
            <li><a href="#"><i class="fa fa-cubes"></i> <?= lang('text_themes') ?></a></li>
            <li><a href="#"><i class="fa fa-cog"></i> <?= lang('text_system') ?></a></li>
            
          </ul>
        </li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

