<?php
/**
 * Created by JetBrains PhpStorm.
 * User: emedinaa
 * Date: 19/09/11
 * Time: 10:00 AM
 * To change this template use File | Settings | File Templates.
 */


Class Miembro
{
    var $nombre;
    var $twitter;
    var $web;

    public function __construct()
    {

    }
}

$lista = array();

$m1 = new Miembro();
$m1->nombre = 'Eduardo Medina';
$m1->twitter = '@eduardomedina';
$m1->web = 'www.emedinaa.net';

$m11 = new Miembro();
$m11->nombre = 'Diego Lerma';
$m11->twitter = '@diegolerma';
$m11->web = 'www.google.com';

array_push($lista, $m1);
array_push($lista, $m11);

echo json_encode($lista);