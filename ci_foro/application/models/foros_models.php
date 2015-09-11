<?php
class Foros_models extends CI_Model {

    function __construct() {
        parent::__construct();
        $this->load->database();
    }

    function getCategorias($padre = 0) {
        $this->db->where("padre", $padre);
        $q = $this->db->get('forum_cat');
        return $q;
    }

}

?>