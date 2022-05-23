<?php

namespace App\Classes;


header('Access-Control-Allow-Origin:*');


class Guru
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
        $data['guru'] = $this->_db->other_query("SELECT * FROM t_guru", 2);
        view('layouts/_head');
        view('guru/index', $data);
        view('layouts/_foot');
    }

    public function tambah_guru()
    {
        $data['pendidikan'] = [
            'D3',
            'D4',
            'S1',
            'S2',
            'S3'
        ];
        $kode_terakhir = $this->_db->get_last_param('t_guru', 'kode_alternatif');
        if ($kode_terakhir) {
            $nilai_kode = substr($kode_terakhir['kode_alternatif'], 1);
            $kode = (int) $nilai_kode;
            $kode = $kode + 1;
            $kode_otomatis = "G" . str_pad($kode, 1, "0", STR_PAD_LEFT);
        } else {
            $kode_otomatis = "G1";
        }
        $data['kode_otomatis'] = $kode_otomatis;
        view('layouts/_head');
        view('guru/tambah_data', $data);
        view('layouts/_foot');
    }
    public function proses_tambah_guru()
    {
        $input = post();
        $kode_alternatif = $input['kode_alternatif'];
        $nip             = $input['nip'];
        $nama_lengkap    = $input['nama_lengkap'];
        $jenis_kelamin   = $input['jenis_kelamin'];
        $tempat_lahir    = $input['tempat_lahir'];
        $tanggal_lahir   = $input['tanggal_lahir'];
        $pendidikan      = $input['pendidikan'];
        $pangkat_golongan = $input['pangkat_golongan'];
        $tanggal_masuk   = $input['tanggal_masuk'];

        // insert t_guru
        $insert = $this->_db->insert("
            INSERT INTO t_guru (
                kode_alternatif,
                nip,
                nama_lengkap,
                jenis_kelamin,
                tempat_lahir,
                tanggal_lahir,
                pendidikan,
                pangkat_golongan,
                tanggal_masuk
            ) VALUES (
                '$kode_alternatif',
                '$nip',
                '$nama_lengkap',
                '$jenis_kelamin',
                '$tempat_lahir',
                '$tanggal_lahir',
                '$pendidikan',
                '$pangkat_golongan',
                '$tanggal_masuk'
            )");

        if ($insert) {
            $res['status'] = 1;
            $res['msg'] = "Data Guru berhasil ditambahkan";
            $res['page'] = "Guru";
        } else {
            $res['status'] = 0;
            $res['msg'] = "Data Guru gagal ditambahkan";
        }

        echo json_encode($res);
    }
    public function ubah_guru($kode_alternatif)
    {
        $data['pendidikan'] = [
            'D3',
            'D4',
            'S1',
            'S2',
            'S3'
        ];
        $data['guru'] = $this->_db->other_query("SELECT * FROM t_guru WHERE kode_alternatif = '$kode_alternatif'");
        view('layouts/_head');
        view('guru/ubah_data', $data);
        view('layouts/_foot');
    }
    public function proses_ubah_guru()
    {
        $input            = post();
        $kode_alternatif  = $input['kode_alternatif'];
        $nip              = $input['nip'];
        $nama_lengkap     = $input['nama_lengkap'];
        $jenis_kelamin    = $input['jenis_kelamin'];
        $tempat_lahir     = $input['tempat_lahir'];
        $tanggal_lahir    = $input['tanggal_lahir'];
        $pendidikan       = $input['pendidikan'];
        $pangkat_golongan = $input['pangkat_golongan'];
        $tanggal_masuk    = $input['tanggal_masuk'];

        // update t_guru
        $update = $this->_db->edit("
            UPDATE t_guru SET
                nip = '$nip',
                nama_lengkap = '$nama_lengkap',
                jenis_kelamin = '$jenis_kelamin',
                tempat_lahir = '$tempat_lahir',
                tanggal_lahir = '$tanggal_lahir',
                pendidikan = '$pendidikan',
                pangkat_golongan = '$pangkat_golongan',
                tanggal_masuk = '$tanggal_masuk'
            WHERE kode_alternatif = '$kode_alternatif'
        ");

        if ($update) {
            $res['status'] = 1;
            $res['msg'] = "Data berhasil diubah";
            $res['page'] = "guru";
        } else {
            $res['status'] = 0;
            $res['msg'] = "Data gagal diubah";
        }

        echo json_encode($res);
    }
    public function hapus_guru()
    {
        $input = post();
        $id = $input['id'];
        $delete = $this->_db->delete('t_guru', 'kode_alternatif', "'" . $id . "'");
        if ($delete) {
            $res['status'] = 1;
            $res['msg'] = "Data berhasil dihapus";
            $res['page'] = "guru";
        } else {
            $res['status'] = 0;
            $res['msg'] = "Data gagal dihapus";
        }
        echo json_encode($res);
    }
}
