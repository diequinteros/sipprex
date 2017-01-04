<?php
ini_set("date.timezone","America/El_Salvador");
      $sesion = false;
      $filename = basename($_SERVER['PHP_SELF']);
      if(isset($_SESSION['carnet']) || isset($_SESSION['id_exalumnos']) || isset($_SESSION['codigo_admin']) || isset($_SESSION['id_empresa']))
      {
        if(isset($_SESSION['carnet']))
		{
		print("
			<div id='fixednav' class='navbar-fixed'>
					<!-- contenido dropdown ajustes -->
				<ul id='ajustes' class='dropdown-content z-depth-2'>
				<li ><a href='../sesiones/versesiones.php' class='orange-text'>Sesiones abiertas</a></li>
				<li ><a href='../mail/mail.php' class='orange-text'>Mensajes</a></li>
				<li ><a href='../bibliotecas/logout.php' class='orange-text'>Cerrar sesion</a></li>
				</ul>
				<ul id='ajustes2' class='dropdown-content z-depth-2'>
				<li ><a href='../sesiones/versesiones.php' class='orange-text'>Sesiones abiertas</a></li>
				<li ><a href='../mail/mail.php' class='orange-text'>Mensajes</a></li>
				<li ><a href='../bibliotecas/logout.php' class='orange-text'>Cerrar sesion</a></li>
				</ul>
				<nav class='orange lighten-1 z-depth-2'>
				<div  id='nav' class=''>
					<img id='imgnav' class='responsive-img hide-on-small-only' src='../img/iconSipprex.png' width='120'>
					<a id = 'navlogo' href='../publico/index.php' class='brand-logo'>Sipprex</a>
					<a href='#' data-activates='mobile-demo' class='button-collapse'><i class='material-icons'>menu</i></a>
					<ul id='navul' class='right hide-on-med-and-down'>
					<li><a href='../publico/pracpalumno.php'>Practicas profesionales</a></li>
					<!-- Dropdown Trigger -->
					<li><a class='dropdown-button' href='#!' data-hover = 'true' data-beloworigin = 'true' data-constrainwidth = 'false' data-activates = 'ajustes'>$_SESSION[nombre_usuario]<i class='material-icons right'>more_vert</i></a></li>
					</ul>
					<ul class='side-nav' id='mobile-demo'>
					<li><a href='../publico/pracpalumno.php'>Practicas profesionales</a></li>
					<!-- Dropdown Trigger -->
					<li><a class='dropdown-button' href='#!' data-hover = 'true' data-beloworigin='true' data-constrainwidth='false' data-activates='ajustes2'>$_SESSION[nombre_usuario]<i class='material-icons right hide-on-med-and-down'>more_vert</i></a></li>
					</ul>
				</div>
				</nav>
				<div id='espa'></div>
			</div>");	
		}
		else{
			if(isset($_SESSION['id_exalumnos']))
			{
				print("
			<div id='fixednav' class='navbar-fixed'>
					<!-- contenido dropdown ajustes -->
				<ul id='ajustes' class='dropdown-content z-depth-2'>
				<li ><a href='../sesiones/versesiones.php' class='orange-text'>Sesiones abiertas</a></li>
				<li ><a href='../mail/mail.php' class='orange-text'>Mensajes</a></li>
				<li ><a href='../bibliotecas/logout.php' class='orange-text'>Cerrar sesión</a></li>
				</ul>
				<ul id='ajustes2' class='dropdown-content z-depth-2'>
				<li ><a href='../sesiones/versesiones.php' class='orange-text'>Sesiones abiertas</a></li>
				<li ><a href='../mail/mail.php' class='orange-text'>Mensajes</a></li>
				<li ><a href='../bibliotecas/logout.php' class='orange-text'>Cerrar sesión</a></li>
				</ul>
				<nav class='orange lighten-1 z-depth-2'>
				<div  id='nav' class=''>
					<img id='imgnav' class='responsive-img hide-on-small-only' src='../img/iconSipprex.png' width='120'>
					<a id = 'navlogo' href='../publico/index.php' class='brand-logo'>Sipprex</a>
					<a href='#' data-activates='mobile-demo' class='button-collapse'><i class='material-icons'>menu</i></a>
					<ul id='navul' class='right hide-on-med-and-down'>
					<li><a href='../publico/profile.php'>Tu información</a></li>
					<!-- Dropdown Trigger -->
					<li><a class='dropdown-button' href='#!' data-hover = 'true' data-beloworigin='true' data-constrainwidth='false' data-activates='ajustes'>$_SESSION[nombre_usuario]<i class='material-icons right'>more_vert</i></a></li>
					</ul>
					<ul class='side-nav' id='mobile-demo'>
						<li><a href='../publico/profile.php'>Tu información</a></li>
					<!-- Dropdown Trigger -->
					<li><a class='dropdown-button' href='#!' data-hover = 'true' data-beloworigin='true' data-constrainwidth='false' data-activates='ajustes2'>$_SESSION[nombre_usuario]<i class='material-iconsright hide-on-med-and-down'>more_vert</i></a></li>
					</ul>
				</div>
				</nav>
				<div id='espa'></div>
			</div>");
			}
			else{
				if(isset($_SESSION['codigo_admin'])){
					print("
						<div id='fixednav' class='navbar-fixed'>
							<!-- contenido dropdown alumnos -->
							<ul id='dropdown1' class='dropdown-content z-depth-2'>
							<li><a href='../admin/alumnos_index.php' class='orange-text'>Alumnos</a></li>
							<li class='divider'></li>
							<li><a href='../admin/seccion_read.php' class='orange-text'>Secciones</a></li>
							<li class='divider'></li>
							<li><a href='../admin/espe_read.php' class='orange-text'>Especialidad</a></li>
							<li class='divider'></li>
							<li><a href='../admin/grado_read.php' class='orange-text'>Grados</a></li>
							<li class='divider'></li>
							<li><a href='../admin/gruposaca_read.php' class='orange-text'>Grupos academicos</a></li>
							<li class='divider'></li>
							<li><a href='../admin/grupotec_index.php' class='orange-text'>Grupos tecnicos</a></li>
							</ul>
							<!-- contenido dropdown ex alumnos -->
							<ul id='dropdown2' class='dropdown-content z-depth-2'>
							<li><a href='../admin/exalumnos_index.php' class='orange-text'>Ex alumnos</a></li>
							<li class='divider'></li>
							<li><a href='../admin/ocupaciones_read.php' class='orange-text'>Ocupaciones</a></li>
							<li class='divider'></li>
							</ul>
							<!-- contenido dropdown empresas -->
							<ul id='dropdown3' class='dropdown-content z-depth-2'>
							<li><a href='../admin/empresa_read.php' class='orange-text'>Empresas</a></li>
							<li class='divider'></li>
							<li><a href='../admin/visitas_read.php' class='orange-text'>Visitas</a></li>
							<li class='divider'></li>
							<li><a href='../admin/empresaes_read.php' class='orange-text'>Especialidades por empresa</a></li>
							<li class='divider'></li>
							<li><a href='../admin/departamento_index.php' class='orange-text'>Departamento por empresa</a></li>
							</ul>
								<!-- contenido dropdown ajustes -->
							<ul id='ajustes' class='dropdown-content z-depth-2'>
							<li ><a href='../sesiones/versesiones.php' class='orange-text'>Sesiones abiertas</a></li>
							<li ><a href='../mail/mail.php' class='orange-text'>Mensajes</a></li>
							<li ><a href='../bibliotecas/logout.php' class='orange-text'>Cerrar sesión</a></li>
							</ul>
							<!-- contenido dropdown alumnos -->
							<ul id='dropdown11' class='dropdown-content z-depth-2'>
							<li><a href='../admin/alumnos_index.php' class='orange-text'>Alumnos</a></li>
							<li class='divider'></li>
							<li><a href='../admin/seccion_read.php' class='orange-text'>Secciones</a></li>
							<li class='divider'></li>
							<li><a href='../admin/espe_read.php' class='orange-text'>Especialidad</a></li>
							<li class='divider'></li>
							<li><a href='../admin/grado_read.php' class='orange-text'>Grados</a></li>
							<li class='divider'></li>
							<li><a href='../admin/gruposaca_read.php' class='orange-text'>Grupos academicos</a></li>
							<li class='divider'></li>
							<li><a href='../admin/grupo_tecnico_index.php' class='orange-text'>Grupos tecnicos</a></li>
							</ul>
							<!-- contenido dropdown ex alumnos -->
							<ul id='dropdown21' class='dropdown-content z-depth-2'>
							<li><a href='../admin/exalumnos_index.php' class='orange-text'>Ex alumnos</a></li>
							<li class='divider'></li>
							<li><a href='../admin/ocupaciones_read.php' class='orange-text'>Ocupaciones</a></li>
							<li class='divider'></li>
							</ul>
							<!-- contenido dropdown empresas -->
							<ul id='dropdown31' class='dropdown-content z-depth-2'>
							<li><a href='../admin/empresa_read.php' class='orange-text'>Empresas</a></li>
							<li class='divider'></li>
							<li><a href='../admin/visitas_read.php' class='orange-text'>Visitas</a></li>
							<li class='divider'></li>
							<li><a href='../admin/empresaes_read.php' class='orange-text'>Especialidades por empresa</a></li>
							<li class='divider'></li>
							<li><a href='../admin/departamento_index.php' class='orange-text'>Departamento por empresa</a></li>
							</ul>
								<!-- contenido dropdown ajustes -->
							<ul id='ajustes1' class='dropdown-content z-depth-2'>
							<li ><a href='../sesiones/versesiones.php' class='orange-text'>Sesiones abiertas</a></li>
							<li ><a href='../mail/mail.php' class='orange-text'>Mensajes</a></li>
							<li ><a href='../bibliotecas/logout.php' class='orange-text'>Cerrar sesión</a></li>
							</ul>
							<nav class='orange lighten-1 z-depth-2'>
							<div  id='nav' class=''>
								<img id='imgnav' class='responsive-img hide-on-small-only' src='../img/iconSipprex.png' width='120'>
								<a id = 'navlogo' href='../admin/index.php' class='brand-logo'>Sipprex</a>
								<a href='#' data-activates='mobile-demo' class='button-collapse'><i class='material-icons'>menu</i></a>
								<ul id='navul' class='right hide-on-med-and-down'>
								<li><a href='../admin/index.php'>Inicio</a></li>
								<!-- Dropdown Trigger -->
								<li><a class='dropdown-button' href='../admin/catalumnos.php' data-hover = 'true' data-beloworigin='true' data-gutter='12' data-constrainwidth='false' data-activates='dropdown1'>Alumnos<i class='material-icons right'>arrow_drop_down</i></a></li>
								<li><a class='dropdown-button' href='../admin/catexalumnos.php' data-hover = 'true' data-beloworigin='true' data-gutter='12' data-constrainwidth='false' data-activates='dropdown2'>Ex alumnos<i class='material-icons right'>arrow_drop_down</i></a></li>
								<li><a class='dropdown-button' href='../admin/catempresas.php' data-hover = 'true' data-beloworigin='true' data-gutter='12' data-constrainwidth='false' data-activates='dropdown3'>Empresas<i class='material-icons right'>arrow_drop_down</i></a></li>
								<li><a href='../admin/registrospp_index.php'>Practicas profesionales</a></li>
								<li><a class='dropdown-button' href='' data-hover = 'true' data-beloworigin='true' data-constrainwidth='false' data-activates='ajustes'>$_SESSION[nombre_usuario]<i class='material-icons right'>more_vert</i></a></li>
								</ul>
								<ul class='side-nav' id='mobile-demo'>
									<li><a href='../admin/index.php'>Inicio</a></li>
								<!-- Dropdown Trigger -->
								<li><a class='dropdown-button' href='../admin/catalumnos.php' data-hover = 'true' data-beloworigin='true' data-gutter='12' data-constrainwidth='false' data-activates='dropdown11'>Alumnos<i class='material-icons right hide-on-med-and-down'>arrow_drop_down</i></a></li>
								<li><a class='dropdown-button' href='../admin/catexalumnos.php' data-hover = 'true' data-beloworigin='true' data-gutter='12' data-constrainwidth='false' data-activates='dropdown21'>Ex alumnos<i class='material-icons right hide-on-med-and-down'>arrow_drop_down</i></a></li>
								<li><a class='dropdown-button' href='../admin/catempresas.php' data-hover = 'true' data-beloworigin='true' data-gutter='12' data-constrainwidth='false' data-activates='dropdown31'>Empresas<i class='material-icons right hide-on-med-and-down'>arrow_drop_down</i></a></li>
								<li><a href='../admin/registrospp_index.php'>Practicas profesionales</a></li>
								<li><a class='dropdown-button' href='' data-hover = 'true' data-beloworigin='true' data-constrainwidth='false' data-activates='ajustes1'>$_SESSION[nombre_usuario]<i class='material-icons hide-on-med-and-down'>more_vert</i></a></li>
								</ul>
							</div>
							</nav>
							<div id='espa'></div>
						</div>");
				}
				else {
					if(isset($_SESSION['id_empresa']))
					{
						print("
					<div id='fixednav' class='navbar-fixed'>
							<!-- contenido dropdown ajustes -->
						<ul id='ajustes' class='dropdown-content z-depth-2'>
						<li ><a href='../sesiones/versesiones.php' class='orange-text'>Sesiones abiertas</a></li>
						<li ><a href='../mail/mail.php' class='orange-text'>Mensajes</a></li>
						<li ><a href='../bibliotecas/logout.php' class='orange-text'>Cerrar sesión</a></li>
						</ul>
						<ul id='ajustes2' class='dropdown-content z-depth-2'>
						<li ><a href='../sesiones/versesiones.php' class='orange-text'>Sesiones abiertas</a></li>
						<li ><a href='../mail/mail.php' class='orange-text'>Mensajes</a></li>
						<li ><a href='../bibliotecas/logout.php' class='orange-text'>Cerrar sesión</a></li>
						</ul>
						<nav class='orange lighten-1 z-depth-2'>
						<div  id='nav' class=''>
							<img id='imgnav' class='responsive-img hide-on-small-only' src='../img/iconSipprex.png' width='120'>
							<a id = 'navlogo' href='../publico/index_empresa.php' class='brand-logo'>Sipprex</a>
							<a href='#' data-activates='mobile-demo' class='button-collapse'><i class='material-icons'>menu</i></a>
							<ul id='navul' class='right hide-on-med-and-down'>
							<li><a href='../publico/index_empresa.php'>Inicio</a></li>
							<li><a href='../publico/actualizar_info.php'>Tu información</a></li>
							<!-- Dropdown Trigger -->
							<li><a class='dropdown-button' href='#!' data-hover = 'true' data-beloworigin='true' data-constrainwidth='false' data-activates='ajustes'>Ajustes<i class='material-icons right'>more_vert</i></a></li>
							</ul>
							<ul class='side-nav' id='mobile-demo'>
								<li><a href='../publico/actualizar_info.php'>Tu información</a></li>
							<!-- Dropdown Trigger -->
							<li><a class='dropdown-button' href='#!' data-hover = 'true' data-beloworigin='true' data-constrainwidth='false' data-activates='ajustes2'>Ajustes<i class='material-iconsright hide-on-med-and-down'>more_vert</i></a></li>
							</ul>
						</div>
						</nav>
						<div id='espa'></div>
					</div>");
					}
				}
			}
		}
      }
      else {
		  header("location: ../publico/login.php");
	  }
?>
