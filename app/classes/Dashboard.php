<?php

namespace App\Classes;
header('Access-Control-Allow-Origin:*');


class Dashboard
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
        $title = 'Sistem Pendukung Keputusan Penilaian Kinerja Guru';
        $data['title'] = $title;
        view('layouts/_head');
        view('dashboard', $data);
        view('layouts/_foot');
    }
}
