<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Text Editors
        <small>Advanced form element</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Editors</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">CK Editor
                <small>Advanced and full of features</small>
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
        
        <!-- /.box-header -->
        <div class="box-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label>Text</label>
                  <input type="text" class="form-control" placeholder="Enter ...">
              </div>
            </div>
            <!-- /.col -->
            <div class="col-md-3">
              <div class="form-group">
                <label>Minimal</label>
                <select class="form-control select2" style="width: 100%;">
                  <option selected="selected">Alabama</option>
                  <option>Alaska</option>
                  <option>California</option>
                  <option>Delaware</option>
                  <option>Tennessee</option>
                  <option>Texas</option>
                  <option>Washington</option>
                </select>
              </div>
            </div>
            <!-- /.col -->
            <!-- /.col -->
            <div class="col-md-3">
              <div class="form-group">
                <label>Date:</label>

                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" class="form-control pull-right" id="datepicker">
                </div>
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
            <label>Text</label>
              <form>
                    <textarea id="editor1" name="editor1" rows="10" cols="80">
                                            This is my textarea to be replaced with CKEditor.
                    </textarea>
              </form>
            </div>
            
            
            <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        
        <!-- /.box-header -->
        <div class="box-body">
            <div class="row">
            <div class="col-sm-3">
                <label>Миниатюра</label>
                <img class="img-responsive" src="/modules/admin/views/dist/img/photo2.png" alt="Photo">
            <div class="form-group">
                  <label for="exampleInputFile"></label>
                  <input type="file" id="exampleInputFile">

                  <p class="help-block">Example block-level help text here.</p>
                </div>
            </div>
            
            
                
            <div class="col-md-9">
              <div class="form-group">
                <label>Meta description</label>
                  <input type="text" class="form-control" placeholder="Enter ...">
              </div>
            </div>

            <div class="col-sm-9">
              <div class="form-group">
                <label>Meta keywords</label>
                      <textarea class="form-control" id="inputExperience" placeholder="Experience"></textarea>
              </div>
            </div>
            
            <div class="col-md-9">
              <div class="form-group">
                <label>Теги</label>
                  <input type="text" class="form-control" placeholder="Enter ...">
              </div>
            </div>
            
            
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
<script src="/modules/admin/views/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/modules/admin/views/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="/modules/admin/views/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/modules/admin/views/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="/modules/admin/views/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/modules/admin/views/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/modules/admin/views/dist/js/app.min.js"></script>

<!-- InputMask -->
<script src="/modules/admin/views/plugins/input-mask/jquery.inputmask.js"></script>
<script src="/modules/admin/views/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="/modules/admin/views/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="/modules/admin/views/plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="/modules/admin/views/plugins/datepicker/bootstrap-datepicker.js"></script>

<!-- CK Editor-->
<script src="/modules/admin/ckeditor/ckeditor.js"></script> 
<!--<script src="//cdn.ckeditor.com/4.5.11/full/ckeditor.js"></script>-->
<!-- Bootstrap WYSIHTML5 -->
<script src="/modules/admin/views/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
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
<script src="/modules/admin/views/dist/js/demo.js"></script>

