<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pengunjung extends CI_Controller {

	public function index()
	{
		$data['pengunjung']=$this->db->query("SELECT * from pengunjung")->result_array();
		$this->admin->load('admin/template','admin/form/pengunjung/data_pengunjung', $data);
	}
	public function tambah()
	{
		
		$this->admin->load('admin/template','admin/form/pengunjung/tambah_pengunjung');
	}
	
	public function simpan()
	{
		$tgl = $this->input->post('tgl');
		$nama = $this->input->post('nama');
		$pj = $this->input->post('pj');
		$nohp_pj = $this->input->post('nohp_pj');
		$status = $this->input->post('status');
		$data = [
			'nama_kelompok'=>$nama,
			'tgl_kunjungan'=>$tgl,
			'pj'=>$pj,
			'nohp_pj'=>$nohp_pj,
			'status '=>$status,
		];
		$this->db->insert('pengunjung', $data);
		$this->session->set_flashdata('pesan','<div class="alert alert-success">Data pengunjung berhasil ditambahkan</div>');
		redirect('user/admin/pengunjung');
	}



	public function simpan_detail()
	{
		$id = $this->input->post('id');
		$nama = $this->input->post('nama');
		$alamat = $this->input->post('alamat');
		$nohp = $this->input->post('nohp');
		$pendidikan = $this->input->post('pendidikan');
		$produk = $this->input->post('produk');
		$qty = $this->input->post('qty');
		
		$data = [
			'id_pengunjung'=>$id,
			'nama'=>$nama,
			'alamat'=>$alamat,
			'no_hp'=>$nohp,
			'pendidikan'=>$pendidikan,
			'id_produk'=>$produk,
			
		];
		$this->db->insert('detail_pengunjung', $data);


         $last_insert_id = $this->db->insert_id(); 
         $data_pesanan = [
			'id_pengunjung'=>$id,
			'id_detail_pengunjung'=>$last_insert_id,
			'id_produk'=>$produk,
			'qty'=>$qty,
		];
		$this->db->insert('pesanan', $data_pesanan);
		$this->session->set_flashdata('pesan','<div class="alert alert-success">Data detail pengunjung berhasil ditambahkan</div>');
		redirect('user/admin/pengunjung/detail/'.$id);
	}

	public function simpan_tambah_menu()
	{
		$id = $this->input->post('id');
		$id_pengunjung = $this->input->post('id_pengunjung');
		
		$produk = $this->input->post('produk');
		$qty = $this->input->post('qty');
		
	
         $data_pesanan = [
			'id_pengunjung'=>$id_pengunjung,
			'id_detail_pengunjung'=>$id,
			'id_produk'=>$produk,
			'qty'=>$qty,
		];
		$this->db->insert('pesanan', $data_pesanan);
		$this->session->set_flashdata('pesan','<div class="alert alert-success">Data detail pengunjung berhasil ditambahkan</div>');
		redirect('user/admin/pengunjung/detail/'.$id_pengunjung);
	}

	public function edit($id)
	{
		
		$data['pengunjung'] = $this->db->get_where('pengunjung', array('id_pengunjung' => $id))->row_array(); 
		$this->admin->load('admin/template','admin/form/pengunjung/edit_pengunjung', $data);
	}
	public function detail($id)
	{
		
		$data['pengunjung'] = $this->db->get_where('pengunjung', array('id_pengunjung' => $id))->row_array(); 
		$data['produk'] = $this->db->get('produk')->result_array(); 
		$data['detail_pengunjung'] = $this->db->query("
			SELECT dp.*, p.nama_produk from detail_pengunjung dp
			left join produk p on dp.id_produk=p.id_produk
			where dp.id_pengunjung = '$id'
			")->result_array(); 
		$this->admin->load('admin/template','admin/form/pengunjung/detail_pengunjung', $data);
	}

	public function simpanedit()
	{
		$id = $this->input->post('id');
		$tgl = $this->input->post('tgl');
		$nama = $this->input->post('nama');
		$pj = $this->input->post('pj');
		$nohp_pj = $this->input->post('nohp_pj');
		$status = $this->input->post('status');
		$data = [
			'nama_kelompok'=>$nama,
			'tgl_kunjungan'=>$tgl,
			'pj'=>$pj,
			'nohp_pj'=>$nohp_pj,
			'status '=>$status,
		];
		$where = [
			'id_pengunjung'=>$id
		];
		$this->db->update('pengunjung', $data, $where);
		$this->session->set_flashdata('pesan','<div class="alert alert-success">Data pengunjung berhasil diperbaharui</div>');
		redirect('user/admin/pengunjung');
	}
	public function hapus($id)
	{
		$this->db->delete('pengunjung', array('id_pengunjung' => $id)); 
			$this->session->set_flashdata('pesan','<div class="alert alert-success">Data pengunjung berhasil dihapus</div>');
		redirect('user/admin/pengunjung');
	}
}
