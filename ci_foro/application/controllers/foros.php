<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Foros extends CI_Controller {

    function __construct() {
        parent::__construct();
    }

    function index() {
        $this->load->model("foros_models", "foros");

        $vars['query'] = $this->foros->getCategorias();
        $this->load->view("header");
        $this->load->view("foros/index", $vars);
        $this->load->view("footer");
    }

}
?>