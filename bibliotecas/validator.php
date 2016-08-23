<?php
class Validator
{
	public static function validateForm($fields)
	{
		foreach ($fields as $index => $value) {
			$value = trim($value);
			$fields[$index] = $value;
		}
		return $fields;
	}

	public static function validateImage($file)
	{
		$img_size = $file["size"];
     	if($img_size <= 2097152)
     	{
     		$img_type = $file["type"];
	     	if($img_type == "image/jpeg" || $img_type == "image/png" || $img_type == "image/gif")
	    	{
	    		$img_temporal = $file["tmp_name"];
	    		$img_info = getimagesize($img_temporal);
		    	$img_width = $img_info[0]; 
				$img_height = $img_info[1];
				if ($img_width == $img_height && $img_width <= 1200)
				{
					$image = file_get_contents($img_temporal);
					return base64_encode($image);
				}
				else
				{
					return false;
				}
	    	}
	    	else
	    	{
	    		return false;
	    	}
     	}
     	else
     	{
     		return false;
     	}
	}
	public static function validateFile($file)
	{
		$file_size = $file["size"];
     	if($file_size <= 2097152)
     	{
     		$file_type = $file["type"];
	     	if($file_type == "application/msword" || $file_type == "application/pdf")
	    	{
	    		$file_temporal = $file["tmp_name"];
				$archivo = file_get_contents($file_temporal);
				return base64_encode($archivo);
	    	}
	    	else
	    	{
	    		return false;
	    	}
     	}
     	else
     	{
     		return false;
     	}
	}
}
?>