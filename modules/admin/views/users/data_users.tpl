<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?= lang('text_users') ?>
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?=base_url()?>admin"><i class="fa fa-dashboard"></i> <?= lang('text_home_admin') ?></a></li>
        <li class="active"> <?= lang('text_users') ?></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          

          <div class="box">
            <div class="box-header">
              <h3 class="box-title"><?= lang('text_users') ?></h3>
              
              <a class="btn btn-app">
                <span class="badge bg-blue"><?php echo Modules::run('modules/admin/users/count_user', 1); ?></span>
                <i class="fa fa-users"></i> ADMIN
              </a>
              <a class="btn btn-app">
                <span class="badge bg-red"><?php echo Modules::run('modules/admin/users/count_user', 0); ?></span>
                <i class="fa fa-users"></i> USER
              </a>
              
            </div>
                <div class="box-footer clearfix no-border">
                <?php if($_SESSION['group_id'] == '0'){ ?>
                    <a type="button" class="btn btn-success pull-left" disabled><i class="fa fa-plus"></i> <?= lang('text_add') ?></a>
                <?php }else{ ?>
                    <a href="<?=base_url()?>admin/users/add" type="button" class="btn btn-success pull-left"><i class="fa fa-plus"></i> <?= lang('text_add') ?></a>
                <?php } ?>
                </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                  <th style="width: 70%;"><?= lang('text_Login_Surename_Name') ?></th>
                  <th style="width: 15%;"></th>
                  <th style="width: 15%;"></th>
                </tr>
                </thead>
                <tbody>
                
                <?php foreach($users as $item):?> 
                <tr>
                  <td><b style="color:
                  <?php if ($item['group_id'] == '1') { ?>blue<?php } ?>
                  <?php if ($item['group_id'] == '0') { ?>red<?php } ?>
                  ;"><?=$item['username'];?></b> ( <?=$item['name'];?> <?=$item['surname'];?> )
                  
                   </td>
                   <?php if($_SESSION['group_id'] == '0'){ ?>
                        <td class="mailbox-date"><a href="<?php echo base_url(); ?>admin/users/edit/<?=$item['id'];?>"><i class="fa fa-edit"></i> <?= lang('text_edit') ?></a></td>
                        <td class="mailbox-attachment"><a><i class="fa fa-trash-o"></i> <?= lang('text_delete') ?></a></td>
                   <?php }else{ ?>
                        <td class="mailbox-date"><a href="<?php echo base_url(); ?>admin/users/edit/<?=$item['id'];?>"><i class="fa fa-edit"></i> <?= lang('text_edit') ?></a></td>
                        <td class="mailbox-attachment"><a href="<?php echo base_url(); ?>admin/users/remove/<?=$item['id'];?>"><i class="fa fa-trash-o"></i> <?= lang('text_delete') ?></a></td>
                   <?php } ?>
                </tr>
                <?php endforeach;?>
              
                </tbody>
                <tfoot>
                <tr>
                  <th><?= lang('text_Login_Surename_Name') ?></th>
                  <th></th>
                  <th></th>
                </tr>
                </tfoot>
              </table>
                <div class="box-footer clearfix no-border">
                <?php if($_SESSION['group_id'] == '0'){ ?>
                    <a href="<?=base_url()?>admin/users/add" type="button" class="btn btn-success pull-left" disabled=""><i class="fa fa-plus"></i> <?= lang('text_add') ?></a>
                <?php }else{ ?>
                    <a href="<?=base_url()?>admin/users/add" type="button" class="btn btn-success pull-left"><i class="fa fa-plus"></i> <?= lang('text_add') ?></a>
                <?php } ?>
                </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
            <!-- /.box-body -->
            
          
    
    
    
    
  </div>
  <!-- /.content-wrapper -->
  
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
<!-- AdminLTE for demo purposes -->
<script src="<?php echo base_url(); ?>modules/admin/views/dist/js/demo.js"></script>
<!-- page script -->
<script>
  $(function () {
    $("#example1").DataTable({
        "language": {
            "url": "<?php echo base_url(); ?>assets/js/<?php echo $this->session->userdata('lang'); ?>.json"
        }
    }
    );
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>
  