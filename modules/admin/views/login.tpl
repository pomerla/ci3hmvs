<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Авторизация - AdminLTE</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<?php echo base_url('modules/admin/views/bootstrap/css/bootstrap.min.css'); ?>" />
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css" />
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo base_url('modules/admin/views/dist/css/AdminLTE.min.css'); ?>" />
  <!-- iCheck -->
  <link rel="stylesheet" href="<?php echo base_url('modules/admin/views/plugins/iCheck/square/blue.css'); ?>" />

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
    background: url('<?php echo base_url('modules/admin/views/dist/img/preloader.gif'); ?>') no-repeat 50% 50%;
    margin: -16px 0 0 -16px;
}
</style>
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
</head>
<script type="text/javascript">
$(window).on('load', function () {
    var $preloader = $('#page-preloader'),
        $spinner   = $preloader.find('.spinner');
    $spinner.fadeOut();
    $preloader.delay(350).fadeOut('slow');
});
</script>

<div id="page-preloader"><span class="spinner"></span></div>
<body class="hold-transition login-page">



<div class="login-box">
  <div class="login-logo">
    <a href="<?php echo base_url('admin'); ?>"><b><?php echo $text_login; ?></b> </a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">

    {error}
    
    <form action="<?php echo base_url('admin'); ?>" method="post">
      <div class="form-group has-feedback">
        <input name="login" id="login" class="form-control" placeholder="Email" value="" />
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input name="password" id="password" type="password" class="form-control" placeholder="Password" value="" />
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"/> <?php echo $text_remember_me; ?>
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat"><?php echo $text_sign_in; ?></button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    <!-- /.social-auth-links -->

<div class="row">

    <div class="col-md-6">
        <a href="<?php echo base_url('admin/forgot'); ?>"><?php echo $text_forgot; ?></a><br>
    </div>
    
    <div class="col-md-4 col-md-push-2">              
     <div class="btn-group">
        <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown" btn-icon="" title="Языки"><i class="fa fa-globe"></i> <?php echo $text_lang; ?></button>
     
        <ul class="dropdown-menu">
            <li><a href="<?php echo base_url('admin/set_language'); ?>/english">English</a></li>
            <li><a href="<?php echo base_url('admin/set_language'); ?>/russian">Русский</a></li>
            <li><a href="<?php echo base_url('admin/set_language'); ?>/ukrainian">Українська</a></li>
        </ul>
     </div>                              
    </div>

</div>

  </div>
  <!-- /.login-box-body -->
  <div class="lockscreen-footer text-center">
    <a href="<?php echo base_url(); ?>">Вернутся а сайт</a> <br />
    <b>Copyright &copy; <?php echo date("Y"); ?> <a href="<?php echo CMS_DEV_URL ?>" class="text-black"><?php echo CMS_DEV ?></a></b><br />
    <strong><?php echo CMS_NAME ?> - <?php echo CMS_VERSION ?></strong>
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="<?php echo base_url('modules/admin/views/plugins/jQuery/jquery-2.2.3.min.js'); ?>"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<?php echo base_url('modules/admin/views/bootstrap/js/bootstrap.min.js'); ?>"></script>
<!-- iCheck -->
<script src="<?php echo base_url('modules/admin/views/plugins/iCheck/icheck.min.js'); ?>"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>
