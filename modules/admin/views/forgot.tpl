<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Admin | {title}</title>
  <!-- Tell the browser to be responsive to screen width <?php echo base_url(); ?>-->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<?php echo base_url('modules/admin/views/bootstrap/css'); ?>/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo base_url('modules/admin/views/dist/css'); ?>/AdminLTE.min.css">

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
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>  
</head>

<body class="hold-transition lockscreen">
<!-- Automatic element centering -->
<div class="lockscreen-wrapper">
<script type="text/javascript">
$(window).on('load', function () {
    var $preloader = $('#page-preloader'),
        $spinner   = $preloader.find('.spinner');
    $spinner.fadeOut();
    $preloader.delay(350).fadeOut('slow');
});
</script>

<div id="page-preloader"><span class="spinner"></span></div>
  <div class="lockscreen-logo">
    <a href="admin"><b>Admin</b></a>
  </div>
  <!-- User name -->
  <div class="lockscreen-name">John Doe</div>

  <!-- START LOCK SCREEN ITEM -->
  <div class="lockscreen-item">
    <!-- lockscreen image -->
    <div class="lockscreen-image">
      <img src="<?php echo base_url(); ?>modules/admin/views/dist/img/user3-128x128.jpg" alt="User Image">
    </div>
    <!-- /.lockscreen-image -->

    <!-- lockscreen credentials (contains the form) -->
    <form class="lockscreen-credentials">
      <div class="input-group">
        <input type="mail" class="form-control" placeholder="Email" />

        <div class="input-group-btn">
          <button type="button" class="btn"><i class="fa fa-arrow-right text-muted"></i></button>
        </div>
      </div>
    </form>
    <!-- /.lockscreen credentials -->

  </div>
  <!-- /.lockscreen-item -->
  <div class="help-block text-center">
    Ваш Email для восстановленя
  </div>
  <div class="text-center">
    <a href="<?php echo base_url(); ?>admin">Назад к авторизации</a>
  </div>
  <div class="lockscreen-footer text-center">
    <b>Copyright &copy; <?php echo date("Y"); ?> <a href="<?php echo CMS_DEV_URL ?>" class="text-black"><?php echo CMS_DEV ?></a></b><br />
    <strong><?php echo CMS_NAME ?> - <?php echo CMS_VERSION ?></strong>
  </div>
</div>
<!-- /.center -->

<!-- jQuery 2.2.3 -->
<script src="<?php echo base_url(); ?>modules/admin/views/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<?php echo base_url(); ?>modules/admin/views/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
