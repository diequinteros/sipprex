<?php
public static function soloLetras($Epresas){
  if(preg_match('/[^a-Z]/',$Epresas)) 
  {
  
  return false;
  }
  else
  {
   return true;
  }
}
?>