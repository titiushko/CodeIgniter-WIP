<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Tutorial extends CI_Controller{	

	public function index(){		
		$data['title'] = 'Inicio';
		$data['main_content'] = 'inicio';
		$this->load->view('main_template',$data);
	}
	
	public function acercade(){
		$data['title'] = 'Acerca de';
		$data['main_content'] = 'acercade';
		$this->load->view('main_template',$data);
	}
	
	public function servicios(){
		$data['title'] = 'Servicios';
		$data['main_content'] = 'servicios';
		$this->load->view('main_template',$data);		
	}
	
	public function contacto(){
		$data['title'] = 'Contacto';
		$data['main_content'] = 'contacto';
		$this->load->view('main_template',$data);	
	}

}