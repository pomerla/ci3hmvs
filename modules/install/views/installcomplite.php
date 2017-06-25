<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><? echo $page_title; ?></title>	
    <!-- core CSS -->
<link href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css')?>" rel="stylesheet" />
	<link href="<?php echo base_url('assets/css/style.css')?>" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url('assets/css/font-awesome.css')?>" rel="stylesheet" type="text/css" />
	<link id="page_favicon" href="<?php echo base_url('assets/css/appicon.png')?>" rel="icon" type="image/x-icon" />  
 
<!-- for RTL support -->
<script type="text/javascript" src="<?php echo base_url('assets/js/jquery-1.11.1.min.js')?>"></script>
<!-- end of for modal effect  <?php echo base_url('')?> -->
<script type="text/javascript" src="<?php echo base_url('sitedoc/assets/js/bootstrap.min.js')?>"></script>

<link id="page_favicon" href="<?php echo base_url('assets/css/appicon.png')?>" rel="icon" type="image/x-icon" />   

</head>
  <body>
  
  <div class="blog-masthead">
      <div class="container">
        <nav class="blog-nav">
          <a class="blog-nav-item active" href="<?php echo base_url()?>"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
          
          <a class="navbar-right blog-nav-item" href="<?php echo base_url()?>admin"><i class="fa fa-tachometer" aria-hidden="true"></i> Admin</a>
        </nav>    
      </div>
  </div>
  
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
			     
                 <div class="col-sm-12"><br />
                    <br />
                 </div>
                 
                 <div class="col-sm-12"><br />
                 
                    <div class="alert alert-success alert-dismissable">
                      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                      <strong><?= lang('text_Well_Done') ?></strong> 
                    </div>
                      
                 </div>
			</div>
		</div>
	</div>
	
	
   	
            
    
    <div id="footer">
      <div class="container">
        <p class="text-muted">
        Page rendered in <strong>{elapsed_time}</strong> seconds. 
        <?php echo  (ENVIRONMENT === 'development') ?  'CodeIgniter Version <strong>' . CI_VERSION . '</strong>' : '' ?>
        </p>
      </div>
    </div>
    
       
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<?php echo base_url('assets/bootstrap/js/bootstrap.min.js')?>"></script>
  </body>
</html>