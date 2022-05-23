<?php

namespace App\Classes;


header('Access-Control-Allow-Origin:*');


class Laporan
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
        $data['role'] = (session_get('type') == 1) ? 'Admin' : 'Kepala Pelaksana';
        view('layouts/_head');
        view('dashboard', $data);
        view('layouts/_foot');
    }

    public function generate()
    {
        $pdf = new \FPDF();
        $pdf->AddPage();
        $pdf->SetFont('Arial', 'B', 16);
        $pdf->Image(FCPATH . 'assets/images/kop.png', -2, -3, 220);
        $pdf->Cell(40, 10, 'Hello World!');
        $pdf->Output();
    }
}
