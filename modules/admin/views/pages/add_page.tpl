<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?= lang('text_pages_add') ?>
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?=base_url()?>admin"><i class="fa fa-dashboard"></i> <?= lang('text_home_admin') ?></a></li>
        <li><a href="<?=base_url()?>admin/pages"><i class="fa fa-file-text"></i> <?= lang('text_pages') ?></a></li>
        <li class="active"><?= lang('text_pages_add') ?></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title"><?= lang('text_pages_add') ?>
                <small></small>
              </h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                  <i class="fa fa-minus"></i></button>
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            
            <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
<form method="post" action="<?php echo base_url(); ?>admin/pages/add">       
        <!-- /.box-header -->
        <div class="box-body">
          <div class="row">
          
          
            <div class="col-md-7">
              <div class="form-group">
                <label><?= lang('text_page_title') ?></label>
                  <input name="title" value="<?=set_value('title')?>" type="text" class="form-control" placeholder="Enter ...">
                  <?=form_error('title')?>
              </div>
            </div>
            <!-- /.col -->
            <div class="col-md-3">
              <div class="form-group">
                <label>url</label>                
                  <input name="uri" value="<?=set_value('uri')?>" type="text" class="form-control" placeholder="Enter ...">
                  <?=form_error('uri')?>
                  
              </div>
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /SELECT2 EXAMPLE .box -->
      
      
      
            
            <div class="box-body pad">
            <label><?= lang('text_page_content') ?></label>
              <div class="col-md-12"><?=form_error('text')?></div>
                    <textarea name="text" id="editor1" name="editor1" rows="10" cols="80">
                    <?=set_value('text')?>
                    </textarea>
              
            </div>
            
            
            <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        
        <!-- /.box-header -->
        <div class="box-body">
            <div class="row">

            <div class="col-sm-12">
              <div class="form-group">
                <label>Meta description</label>
                      <textarea name="description" class="form-control" id="inputExperience" placeholder="Experience"><?=set_value('description')?></textarea>
              </div>
            </div>
            
            <div class="col-md-12">
              <div class="form-group">
                <label>Meta keywords</label>
                  <input name="keywords" value="<?=set_value('keywords')?>" type="text" class="form-control" placeholder="Enter ...">
              </div>
            </div>
            
            <div class="col-md-12">
              <div class="form-group">
                <label><?= lang('text_page_tegs') ?></label>
                  <input name="tags" value="<?=set_value('tags')?>" type="text" class="form-control" placeholder="Enter ...">
              </div>
            </div>
            
            <div class="col-md-2">
                <div class="form-group">
                <?php if($_SESSION['group_id'] == '0'){ ?>
                    <input name="add" class="btn btn-block btn-success" type="submit" value="<?= lang('text_page_record') ?>" disabled=""/>
                <?php }else{ ?>
                    <input name="add" class="btn btn-block btn-success" type="submit" value="<?= lang('text_page_record') ?>" />
                <?php } ?>
                </div>
            </div>
</form>           
          </div>
          <!-- /.row -->
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /SELECT2 EXAMPLE .box -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col-->
      </div>
      <!-- ./row -->
    </section>
    <!-- /.content -->
  </div>


<!-- REQUIRED JS SCRIPTS -->


<!-- jQuery 2.2.3 -->
<script src="<?php echo base_url(); ?>modules/admin/views/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<?php echo base_url(); ?>modules/admin/views/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="<?php echo base_url(); ?>modules/admin/views/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<?php echo base_url(); ?>modules/admin/views/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="<?php echo base_url(); ?>modules/admin/views/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="<?php echo base_url(); ?>modules/admin/views/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<?php echo base_url(); ?>modules/admin/views/dist/js/app.min.js"></script>

<!-- InputMask -->
<script src="<?php echo base_url(); ?>modules/admin/views/plugins/input-mask/jquery.inputmask.js"></script>
<script src="<?php echo base_url(); ?>modules/admin/views/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="<?php echo base_url(); ?>modules/admin/views/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="<?php echo base_url(); ?>modules/admin/views/plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="<?php echo base_url(); ?>modules/admin/views/plugins/datepicker/bootstrap-datepicker.js"></script>

<!-- CK Editor-->
<script src="<?php echo base_url(); ?>modules/admin/ckeditor/ckeditor.js"></script> 
<!--<script src="//cdn.ckeditor.com/4.5.11/full/ckeditor.js"></script>-->
<!-- Bootstrap WYSIHTML5 -->
<script src="<?php echo base_url(); ?>modules/admin/views/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script>
  $(function () {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    CKEDITOR.replace('editor1');  
  });
  
  $('#datepicker').datepicker({
      autoclose: true
    });
</script>
<!-- AdminLTE for demo purposes -->
<script src="<?php echo base_url(); ?>modules/admin/views/dist/js/demo.js"></script>

