 <div class="row">
    <div class="col-md-6">
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Tambah metode pembayaran</h3>
          <div class="pull-right">
            <a href="<?php echo base_url('user/admin/pengunjung') ?>" class="btn btn-info">Kembali</a>
          </div>
        </div>
        <div class="box-body">
          <form action="<?php echo base_url('user/admin/pengunjung/simpan') ?>" method='post'>
          
            <div class="form-group">
              <label>Tanggal Kunjungan</label>
              <input type="date" name="tgl" class="form-control" required value="<?php echo date('Y-m-d') ?>">
            </div>
            <div class="form-group">
              <label>Nama Pengunjung</label>
              <input type="text" name="nama" class="form-control" required>
            </div>
            <div class="form-group">
              <label>Penanggung Jawab</label>
              <input type="text" name="pj" class="form-control" required>
            </div>
            <div class="form-group">
              <label>No HP Penanggung Jawab</label>
              <input type="text" name="nohp_pj" class="form-control" required>
            </div>
            <div class="form-group">
              <label>Status</label>
              <select name="status" class="form-control">
                <option value="Booking">Booking</option>
                <option value="Langsung Di Tempat">Langsung Di Tempat</option>
              </select>
            </div>
            
            <div class="form-group">
              <input type="submit" value="Simpan data Pengunjung" class="btn btn-info">
            </div>
          </form>
        </div>


      </div>
    </div>
  </div>
