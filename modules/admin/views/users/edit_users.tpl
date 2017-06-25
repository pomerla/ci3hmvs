<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!-- jQuery 2.2.3  -->
<script src="<?php echo base_url(); ?>modules/admin/views/plugins/jQuery/jquery-2.2.3.min.js"></script>
<link rel="stylesheet" href="<?php echo base_url(); ?>modules/admin/views/dist/css/jquery-ui.css">
<link rel="stylesheet" href="<?php echo base_url(); ?>modules/admin/views/dist/css/style.css">
  
  <script src="<?php echo base_url(); ?>modules/admin/views/dist/js/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#dialog" ).dialog({
      autoOpen: false,
      show: {
        effect: "blind",
        duration: 300
      },
      hide: {
        effect: "explode",
        duration: 300
      }
    });
 
    $( "#opener" ).on( "click", function() {
      $( "#dialog" ).dialog( "open" );
    });
    
    //$("label").click(function () {
     //var text = $(this).text();
     //$("input#us").val(text);
    //});
   
    $("label").dblclick(function(){
        var text = $(this).text();
        $("input#us").val(text);
        $("#result_us").attr("src",text);
        $( "#dialog" ).dialog( "close" );
    });
    
  } );
  
</script>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?= lang('text_user_profile') ?>
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?=base_url()?>admin"><i class="fa fa-dashboard"></i> <?= lang('text_home_admin') ?></a></li>
        <li><a href="<?=base_url()?>admin/users"><i class="fa fa-users"></i> <?= lang('text_users') ?></a></li>
        <li class="active"> <?= lang('text_user_profile') ?></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img id="result_us" class="profile-user-img img-responsive img-circle" src="{img}" alt="User profile picture">

              <h3 id="result_username" class="profile-username text-center">{username}</h3>

              <p class="text-muted text-center"><span id="result_surname">{surname}</span> &nbsp; <span id="result_name">{name}</span></p>



<!-- /.FAILMANADGER -->
<div id="dialog" title="<?= lang('text_img') ?>">
<div style="width:355px; height:250px; overflow-у: auto;">

<?php

$files = array_diff(scandir('upload/images/avatar'), array('..', '.'));
foreach ($files as $file):
    echo '<label><img style="margin-left: 10px;" src="'.base_url().'upload/images/avatar/'.$file.'" width="77px" height="77px"/><a style="display:none;">'.base_url().'upload/images/avatar/'.$file.'</a> </label>';
    
endforeach;

?>
<!-- plan na buduschee -->
<!-- <p>This is an animated dialog which.</p> -->
<!-- <form id="upload" method="post" action="modules/admin/views/plugins/upload.php" enctype="multipart/form-data"> -->
<!--     <div id="drop"> -->
<!--     Drop Here -->
<!--         <a>Browse</a> -->
<!--         <input type="file" name="upl" multiple /> -->
<!--     </div> -->
<!-- <ul><!-- The file uploads will be shown here --><!-- </ul> -->
<!--</form> -->
</div> 
</div>



<div class="col-md-12">
    <button class="btn btn-primary btn-block" id="opener"><?= lang('text_edit') ?></button>
</div>


<!-- /.FAILMANADGER -->


              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->


        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#settings" data-toggle="tab"><?= lang('text_settings') ?></a></li>
              <!-- <li><a href="#activity" data-toggle="tab">Activity</a></li> -->
            </ul>
            <div class="tab-content">
              
              <!-- tab settings -->  
              <div class="active tab-pane" id="settings">
                <form  method="post" action="<?php echo base_url(); ?>admin/users/update" class="form-horizontal">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label"><?= lang('text_Login') ?></label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputNikName" placeholder="NikName" value="{username}" disabled=""/>
                      <input name="username" type="hidden" class="form-control" id="inputNikName" placeholder="NikName" value="{username}"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label"><?= lang('text_Email') ?></label>

                    <div class="col-sm-10">
                      <input name="email" type="email" class="form-control" id="inputEmail" placeholder="Email" value="{email}" />
                      <?=form_error('email')?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label"><?= lang('text_Surname') ?></label>

                    <div class="col-sm-10">
                      <input name="surname" type="text" class="form-control" id="inputSureName" placeholder="Surname" value="{surname}" />
                      <?=form_error('surname')?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label"><?= lang('text_Name') ?></label>

                    <div class="col-sm-10">
                      <input name="name" type="text" class="form-control" id="inputName" placeholder="Name" value="{name}" />
                      <?=form_error('name')?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label"><?= lang('text_About') ?></label>

                    <div class="col-sm-10">
                      <textarea name="about_me" class="form-control" id="inputExperience" placeholder="about me 250 chars">{about_me}</textarea>
                      <?= lang('text_Characters') ?>: <span id="result"></span>
                    </div>
                  </div>
                  
                  <input name="id" type="hidden" class="form-control" id="inputNikName" placeholder="NikName" value="{id}" />
                  
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label"><?= lang('text_Role') ?></label>
                  <div class="col-sm-10">  
                      <select name="group_id" class="form-control">
                        
                      
                      <option value="{group_id}" selected>
                        <?php if($group_id == '0'){ ?><?= lang('text_Demo') ?><?php } ?>
                        <?php if($group_id == '1'){ ?><?= lang('text_Administrator') ?><?php } ?> 
                      </option>
                        <option value="0"><?= lang('text_Demo') ?></option>
                        <option value="1"><?= lang('text_Administrator') ?></option>
                      
                      
                      </select>
                  </div>
                  </div>
                  
                  
                  
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label"><?= lang('text_language') ?></label>
                  <div class="col-sm-10">  
                      <select name="language" class="form-control">
                      <option value="{language}" selected>
                        <?php if($language == 'russian'){ ?><?= lang('text_Russian') ?><?php } ?>
                        <?php if($language == 'english'){ ?><?= lang('text_English') ?><?php } ?>
                        <?php if($language == 'ukrainian'){ ?><?= lang('text_Ukrainian') ?><?php } ?> 
                      </option>
                        <option value="english"><?= lang('text_English') ?></option>
                        <option value="russian"><?= lang('text_Russian') ?></option>
                        <option value="ukrainian"><?= lang('text_Ukrainian') ?></option>
                      </select>
                  </div>
                  </div>
                  
                  
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label"><?= lang('text_Skin_admins') ?></label>
                  <div class="col-sm-10">  
                      <select name="them_skin" class="form-control">
                      <option value="{them_skin}" selected>
                        <?php if($them_skin == 'blue'){ ?><?= lang('text_Blue') ?><?php } ?>
                        <?php if($them_skin == 'red'){ ?><?= lang('text_Red') ?><?php } ?>
                        <?php if($them_skin == 'yellow'){ ?><?= lang('text_Yellow') ?><?php } ?> 
                        <?php if($them_skin == 'green'){ ?><?= lang('text_Green') ?><?php } ?> 
                        <?php if($them_skin == 'purple'){ ?><?= lang('text_Purple') ?><?php } ?> 
                      </option>
                        <option value="blue"><?= lang('text_Blue') ?></option>
                        <option value="red"><?= lang('text_Red') ?></option>
                        <option value="yellow"><?= lang('text_Yellow') ?></option>
                        <option value="green"><?= lang('text_Green') ?></option>
                        <option value="purple"><?= lang('text_Purple') ?></option>
                      </select>
                  </div>
                  </div>
                  
                  
                  
                  
                  
                  
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label"><?= lang('text_Password') ?></label>

                    <div class="col-sm-10">
                      <input name="password" type="text" class="form-control" id="inputName" placeholder="password" value="" />
                      <?=form_error('password')?>
                    </div>
                  </div>
                  
                  
                  <input name="img" id="us" type="hidden" class="form-control" value="{img}" />
                    
                  
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                    <?php if($_SESSION['group_id'] == '0'){ ?>
                      <button name="update" type="submit" class="btn btn-danger" disabled=""><?= lang('text_Update') ?></button>
                    <?php }else{ ?>  
                      <button name="update" type="submit" class="btn btn-danger"><?= lang('text_Update') ?></button>
                    <?php } ?>
                      
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.tab-pane -->
              
              <!-- tab activity 
              <div class="tab-pane" id="activity">
                йцу
              </div>-->
              <!-- /.tab-pane -->
              
              
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  
<!-- ./wrapper -->

        
        


<!-- Bootstrap 3.3.6 -->
<script src="<?php echo base_url(); ?>modules/admin/views/bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="<?php echo base_url(); ?>modules/admin/views/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<?php echo base_url(); ?>modules/admin/views/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<?php echo base_url(); ?>modules/admin/views/dist/js/demo.js"></script>

 
<!-- JavaScript Includes 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>-->
<script src="<?php echo base_url(); ?>modules/admin/views/dist/js/jquery.knob.js"></script>

<!-- jQuery File Upload Dependencies -->
<script src="<?php echo base_url(); ?>modules/admin/views/dist/js/jquery.ui.widget.js"></script>
<script src="<?php echo base_url(); ?>modules/admin/views/dist/js/jquery.iframe-transport.js"></script>
<script src="<?php echo base_url(); ?>modules/admin/views/dist/js/jquery.fileupload.js"></script>
		
<!-- Our main JS file -->
<script src="<?php echo base_url(); ?>modules/admin/views/dist/js/script.js"></script>
  
<script>
    $('#inputNikName').on('input', function () {
        var msg = $(this).val();
        $("#result_username").text(msg);
    });

    $('#inputName').on('input', function () {
        var msg = $(this).val();
        $("#result_name").text(msg);
    });
    
    $('#inputSureName').on('input', function () {
        var msg = $(this).val();
        $("#result_surname").text(msg);
    });

    $('#us').on('input', function () {
        var msg = $(this).val();
        $("#result_us").attr("src",msg);
    });
    

    
    // подсчет символов
    function showCount() {
    result.innerHTML = inputExperience.value.length;
    }

    inputExperience.onkeyup = inputExperience.oninput = showCount;
    inputExperience.onpropertychange = function() {
      if (event.propertyName == "value") showCount();
    }
    inputExperience.oncut = function() {
      setTimeout(showCount, 0); // на момент oncut значение еще старое
    };
</script> 
 

