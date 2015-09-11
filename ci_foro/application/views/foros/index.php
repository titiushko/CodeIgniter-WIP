<?php
if ($query->num_rows() > 0) {
    foreach ($query->result() as $row) {
        echo '<h2>' . $row->nombre . '</h2>';
        $sub = $this->foros->getCategorias($row->id);
        foreach ($sub->result() as $row2) {
            echo '<h4><a href="index.php/foros/categoria/' . $row2->id . '">' . $row2->nombre . '</a></h4>';
        }
    }
} else {
    echo '<p>No hay ninguna categor&iacute;a creada</p>';
}
?>