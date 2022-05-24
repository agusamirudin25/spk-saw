<?php

namespace App\Classes;


header('Access-Control-Allow-Origin:*');


class Keputusan
{
    protected $_db;
    public function __construct()
    {
        $this->_db = new Database();
        if (!isset($_SESSION['nip'])) {
            redirect('Auth');
        }
    }

    public function index()
    {
        $data['guru'] = $this->_db->getAll('t_guru');
        $penilaian = $this->_db->getAll('v_penilaian');
        $tempData = [];
        foreach ($penilaian as $key => $value) {
            if ($value['K2'] == NULL || $value['K1'] == NULL) {
                $tempData[] = [
                    'kode'   => $value['kd_alternatif'],
                    'nama'   => $value['nama_lengkap'],
                    'K1'     => (int)$value['K1'],
                    'K2'     => (float)$value['K2'],
                    'K3'     => (int)$value['K3'],
                    'K4'     => (int)$value['K4'],
                    'K5'     => (int)$value['K5'],
                    'status' => 0
                ];
            } else {
                $tempData[] = [
                    'kode' => $value['kd_alternatif'],
                    'nama' => $value['nama_lengkap'],
                    'K1' => (int)$value['K1'],
                    'K2' => (float)$value['K2'],
                    'K3' => (int)$value['K3'],
                    'K4' => (int)$value['K4'],
                    'K5' => (int)$value['K5'],
                    'status' => 1
                ];
            }
        }
        $data['penilaian'] = $tempData;
        view('layouts/_head');
        view('keputusan/index', $data);
        view('layouts/_foot');
    }

    public function tambah_penilaian($kode_alternatif)
    {
        $data['guru'] = $this->_db->other_query("SELECT * FROM t_guru WHERE kode_alternatif = '$kode_alternatif'");
        $data['kriteria'] = $this->_db->getAll('t_kriteria');
        $nilai_k2 = $this->_db->other_query("SELECT * FROM t_penilaian WHERE kode_alternatif = '$kode_alternatif' AND kode_kriteria = 'K2'");
        if ($nilai_k2) {
            $data['nilai_k2'] = (float) $nilai_k2->nilai;
        } else {
            $data['nilai_k2'] = 0;
        }
        // pretty($data);
        view('layouts/_head');
        view('keputusan/tambah_data', $data);
        view('layouts/_foot');
    }
    public function proses_tambah_penilaian()
    {
        $nilai = $_POST['nilai'];
        $kd_kriteria = $_POST['kd_kriteria'];
        $kode_alternatif = $_POST['kode_alternatif'];
        $i = 0;
        foreach ($nilai as $row) :
            // insert t_penilaian
            $kode_kriteria = $kd_kriteria[$i++];
            $this->_db->insert("INSERT INTO t_penilaian (kode_alternatif, kode_kriteria, nilai, `status`) VALUES ('$kode_alternatif', '$kode_kriteria', '$row', 1)");
        endforeach;

        $res['status'] = 1;
        $res['msg'] = "Data Penilaian berhasil ditambahkan";
        $res['page'] = "keputusan";

        echo json_encode($res);
    }
    public function ubah_penilaian($kode)
    {
        $data['keputusan'] = $this->_db->other_query("SELECT * FROM v_penilaian WHERE kd_alternatif = '$kode'");
        $data['kriteria'] = $this->_db->other_query("SELECT * FROM t_kriteria", 2);
        // pretty($data);
        view('layouts/_head');
        view('keputusan/ubah_data', $data);
        view('layouts/_foot');
    }
    public function proses_ubah_penilaian()
    {
        $nilai = $_POST['nilai'];
        $kd_kriteria = $_POST['kd_kriteria'];
        $kode_alternatif = $_POST['kode_alternatif'];
        $i = 0;
        foreach ($nilai as $row) :
            // insert t_penilaian
            $kode_kriteria = $kd_kriteria[$i++];
            $this->_db->edit("UPDATE t_penilaian SET nilai = '$row' WHERE kode_alternatif = '$kode_alternatif' AND kode_kriteria = '$kode_kriteria'");
        endforeach;

        $res['status'] = 1;
        $res['msg'] = "Data Penilaian berhasil diubah";
        $res['page'] = "keputusan";

        echo json_encode($res);
    }
    public function hapus_penilaian()
    {
        $input = post();
        $id = $input['id'];
        $this->_db->insert("DELETE FROM t_penilaian WHERE kode_alternatif = '$id' AND kode_kriteria != 'K2'");
        $res['status'] = 1;
        $res['msg'] = "Data berhasil dihapus";
        $res['page'] = "Keputusan";
        echo json_encode($res);
    }
}
