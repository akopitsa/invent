<?php

class SearchComputer
{
        public static function showSearch()
        {
            echo "<script type='text/javascript' src='http://jqueryjs.googlecode.com/files/jquery-1.3.1.min.js' > </script>
            <script type='text/javascript' src='http://www.kunalbabre.com/projects/table2CSV.js' > </script> ";
            $db= new DB();
            $PdoConnect =  new PDO(
                'mysql:host='.$db->dbhost.';dbname='.$db->dbdefault,$db->dbuser,$db->dbpassword,
                array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8")
            );


            $alias=null;
            $res = $PdoConnect->prepare('SELECT * FROM `glpi_groups` where id>3');
            $res->execute();
            $result = $res->fetchAll(PDO::FETCH_ASSOC);

            echo "<form method='Post' name='forSearch' style='text-align:center;'>";
            echo "<label for='grupe'>Группа</label>";
            echo "<select name='grupe'>";
            foreach($result as $r=>$d)
              {
               echo "<option value='$d[id]'>$d[name]</option>";
              }
            echo "<option value='0'>Все</option>";
            echo "</select>";
            echo "      <input type='submit' value='Отфильтровать' style='background:#CCCC44;  box-shadow:2px 2px grey;'></input>";
            echo "      <input type=\"button\" onclick=\"$('#tabla').table2CSV();\" style='border:1px solid black; border-style:outset; background:#CCCC44; box-shadow:2px 2px grey;' value='CSV'></input>";
            echo "</form>";
            echo "<br>";
            echo "<br>";
        }

        public static function showTable($filter=null)
        {
             $db= new DB();
            $PdoConnect =  new PDO(
                'mysql:host='.$db->dbhost.';dbname='.$db->dbdefault,$db->dbuser,$db->dbpassword,
                array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8")
            );

            echo "<table class='tab_cadrehov' id='tabla'  border='0' cellspacing='2'
cellpadding='0' style='width:50%; overflow:scroll;'>";
            echo "<tr  style='background:#CCCC99;font-size:130%;'><th style='text-align:center;'>Группа</th><th style='text-align:center;'>Пользователь</th><th style='text-align:center;'>Монитор</th><th style='text-align:center;'>Материнская плата</th><th style='text-align:center;'>Процессор</th><th style='text-align:center;'>Память</th><th style='text-align:center;'>Винчестер</th><th style='text-align:center;'>SSD</th><th style='text-align:center;'>Видеокарта</th><th style='text-align:center;'>Блок питания</th><th style='text-align:center;'>ПО</th><th style='text-align:center;'>Apple</th></tr>";

            $select = "SELECT users_id,`glpi_groups`.name as grname,`glpi_users`.name FROM `glpi_groups_users` JOIN `glpi_groups` ON `glpi_groups_users`.groups_id = `glpi_groups`.id JOIN `glpi_users` ON `glpi_groups_users`.users_id = `glpi_users`.id ";
            if ($filter)
                {
                    $select=$select."where `glpi_groups_users`.groups_id=:filter";
                }
           $select=$select." ORDER BY grname,`glpi_users`.name";

            $res = $PdoConnect->prepare($select);
           if ($filter)
           {
            $res->execute(array(':filter'=>$filter));
           }
           else
           {
               $res->execute();
           }
            $result = $res->fetchAll(PDO::FETCH_ASSOC);


            foreach($result as $res)
            {
          echo "<tr>";

          // Вывод группы
            echo "<td style='white-space: nowrap;'>";
            echo $res['grname'];
            echo "</td>";

            // Вывод Пользователя
            echo "<td style='white-space: nowrap;'>";
            $resurse = $PdoConnect->prepare("Select name,id from `glpi_users` where id=$res[users_id]");
            $resurse->execute();
            $nameUser=$resurse->fetch(PDO::FETCH_ASSOC);
            $c = "http://".$_SERVER[HTTP_HOST];
            echo "<a href='".$c."/front/user.form.php?id=".$nameUser['id']."'>".$nameUser['name']."</a>";
            echo "</td>";
            


            //Вывод Монитора
            echo "<td style='white-space: nowrap;'>";
            $resurse = $PdoConnect->prepare("Select name,size,groups_id,monitormodels_id from `glpi_monitors` where users_id=$res[users_id]");
            $resurse->execute();
            $nameMonitors=$resurse->fetchAll(PDO::FETCH_ASSOC);
            foreach($nameMonitors as $nameMonitor)
            {
                $resurse = $PdoConnect->prepare("Select * from `glpi_monitormodels` where id=$nameMonitor[monitormodels_id]");
                $resurse->execute();
                $modelMonitor=$resurse->fetch(PDO::FETCH_ASSOC);

                echo $nameMonitor['name'];
                echo " ".$modelMonitor['name'];
                if ($nameMonitor['size']!=0)
                 {
                     echo " ".$nameMonitor['size']."\"";
                 }
                 $resurse = $PdoConnect->prepare("Select * from `glpi_groups` where id=$nameMonitor[groups_id]");
                 $resurse->execute();
                 $group=$resurse->fetch(PDO::FETCH_ASSOC);
                 echo " (".$group['name'].")";

               echo "<br>";
            }
            echo "</td>";

            //Вывод Материнская плата
            echo "<td style='white-space: nowrap;'>";
            $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_motherboards` where users_id=$res[users_id]");
            $resurse->execute();
            $nameMotherboards=$resurse->fetchAll(PDO::FETCH_ASSOC);
            foreach($nameMotherboards as $nameMotherboard)
            {
                $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_motherboardcategories` where id=$nameMotherboard[plugin_genericobject_motherboardcategories_id]");
                $resurse->execute();
                $categoryMotherboard=$resurse->fetch(PDO::FETCH_ASSOC);

                $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_motherboardmodels` where id=$nameMotherboard[plugin_genericobject_motherboardmodels_id]");
                $resurse->execute();
                $modelMotherboard=$resurse->fetch(PDO::FETCH_ASSOC);

                $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_motherboardtypes` where id=$nameMotherboard[plugin_genericobject_motherboardtypes_id]");
                $resurse->execute();
                $typeMotherboard=$resurse->fetch(PDO::FETCH_ASSOC);

                echo $typeMotherboard['name'];
                echo " ";
                echo $nameMotherboard['name'];
                echo " ";
                echo $modelMotherboard['name'];
                echo " ".$categoryMotherboard['name']."";

                $resurse = $PdoConnect->prepare("Select * from `glpi_groups` where id=$nameMotherboard[groups_id]");
                $resurse->execute();
                $group=$resurse->fetch(PDO::FETCH_ASSOC);
                echo " (".$group['name'].")";
               echo "<br>";
            }
            echo "</td>";




            //Вывод Процессор
            echo "<td style='white-space: nowrap;'>";
            $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_processors` where users_id=$res[users_id]");
            $resurse->execute();
            $nameProcessors=$resurse->fetchAll(PDO::FETCH_ASSOC);
            foreach($nameProcessors as $nameProcessor)
            {

                $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_processormodels` where id=$nameProcessor[plugin_genericobject_processormodels_id]");
                $resurse->execute();
                $modelProcessor=$resurse->fetch(PDO::FETCH_ASSOC);

                $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_processortypes` where id=$nameProcessor[plugin_genericobject_processortypes_id]");
                $resurse->execute();
                $typeProcessor=$resurse->fetch(PDO::FETCH_ASSOC);

                echo $typeProcessor['name'];
                echo " ";
                echo $nameProcessor['name'];
                echo " ";
                echo $modelProcessor['name'];
                if ($nameProcessor['other']!=0)
                {
                    echo " ".$nameProcessor['other']."";
                }
                $resurse = $PdoConnect->prepare("Select * from `glpi_groups` where id=$nameProcessor[groups_id]");
                $resurse->execute();
                $group=$resurse->fetch(PDO::FETCH_ASSOC);
                echo " (".$group['name'].")";
               echo "<br>";
            }
            echo "</td>";

            //Вывод Память
            echo "<td style='white-space: nowrap;'>";
            $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_memories` where users_id=$res[users_id]");
            $resurse->execute();
            $nameMemorys=$resurse->fetchAll(PDO::FETCH_ASSOC);
            foreach($nameMemorys as $nameMemory)
            {

                $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_memoriemodels` where id=$nameMemory[plugin_genericobject_memoriemodels_id]");
                $resurse->execute();
                $modelMemory=$resurse->fetch(PDO::FETCH_ASSOC);

                $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_memorietypes` where id=$nameMemory[plugin_genericobject_memorietypes_id]");
                $resurse->execute();
                $typeMemory=$resurse->fetch(PDO::FETCH_ASSOC);

                echo $typeMemory['name'];
                echo " ";
                echo $nameMemory['name'];
                echo " ";
                echo $modelMemory['name'];
                if ($nameMemory['other']!=0)
                {
                    echo " ".$nameMemory['other']."";
                }
                $resurse = $PdoConnect->prepare("Select * from `glpi_groups` where id=$nameMemory[groups_id]");
                $resurse->execute();
                $group=$resurse->fetch(PDO::FETCH_ASSOC);
                echo " (".$group['name'].")";
                echo "<br>";
            }
            echo "</td>";

             //Вывод HDD
            echo "<td style='white-space: nowrap;'>";
            $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_hdds` where users_id=$res[users_id]");
            $resurse->execute();
            $nameHdds=$resurse->fetchAll(PDO::FETCH_ASSOC);
            foreach($nameHdds as $nameHdd)
            {

                $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_hddmodels` where id=$nameHdd[plugin_genericobject_hddmodels_id]");
                $resurse->execute();
                $modelHdd=$resurse->fetch(PDO::FETCH_ASSOC);

                $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_hddtypes` where id=$nameHdd[plugin_genericobject_hddtypes_id]");
                $resurse->execute();
                $typeHdd=$resurse->fetch(PDO::FETCH_ASSOC);

                echo $typeHdd['name'];
                echo " ";
                echo $nameHdd['name'];
                echo " ";
                echo $modelHdd['name'];
                $resurse = $PdoConnect->prepare("Select * from `glpi_groups` where id=$nameHdd[groups_id]");
                $resurse->execute();
                $group=$resurse->fetch(PDO::FETCH_ASSOC);
                echo " (".$group['name'].")";
               echo "<br>";
            }
            echo "</td>";

            //Вывод SSD
            echo "<td style='white-space: nowrap;'>";
            $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_ssds` where users_id=$res[users_id]");
            $resurse->execute();
            $nameSsds=$resurse->fetchAll(PDO::FETCH_ASSOC);
            foreach($nameSsds as $nameSsd)
            {

                $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_ssdmodels` where id=$nameSsd[plugin_genericobject_ssdmodels_id]");
                $resurse->execute();
                $modelSsd=$resurse->fetch(PDO::FETCH_ASSOC);

                $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_ssdtypes` where id=$nameSsd[plugin_genericobject_ssdtypes_id]");
                $resurse->execute();
                $typeSsd=$resurse->fetch(PDO::FETCH_ASSOC);

                echo $typeSsd['name'];
                echo " ";
                echo $nameSsd['name'];
                echo " ";
                echo $modelSsd['name'];
                $resurse = $PdoConnect->prepare("Select * from `glpi_groups` where id=$nameSsd[groups_id]");
                $resurse->execute();
                $group=$resurse->fetch(PDO::FETCH_ASSOC);
                echo " (".$group['name'].")";
                echo "<br>";
            }
            echo "</td>";

            //Вывод Видеокарты
            echo "<td style='white-space: nowrap;'>";
            $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_videocards` where users_id=$res[users_id]");
            $resurse->execute();
            $nameVideocards=$resurse->fetchAll(PDO::FETCH_ASSOC);
            foreach($nameVideocards as $nameVideocard)
            {

                $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_videocardmodels` where id=$nameVideocard[plugin_genericobject_videocardmodels_id]");
                $resurse->execute();
                $modelVideocard=$resurse->fetch(PDO::FETCH_ASSOC);

                echo $nameVideocard['name'];
                echo " ";
                echo $modelVideocard['name'];
                if ($nameVideocard['contact_num']!="")
                {
                    echo " ".$nameVideocard['contact_num']."";
                }

                $resurse = $PdoConnect->prepare("Select * from `glpi_groups` where id=$nameVideocard[groups_id]");
                $resurse->execute();
                $group=$resurse->fetch(PDO::FETCH_ASSOC);
                echo " (".$group['name'].")";
               echo "<br>";
            }
            echo "</td>";



             //Вывод Блок питания
            echo "<td style='white-space: nowrap;'>";
            $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_powers` where users_id=$res[users_id]");
            $resurse->execute();
            $namePowers=$resurse->fetchAll(PDO::FETCH_ASSOC);
            foreach($namePowers as $namePower)
            {

                $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_powermodels` where id=$namePower[plugin_genericobject_powermodels_id]");
                $resurse->execute();
                $modelPower=$resurse->fetch(PDO::FETCH_ASSOC);

                $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_powertypes` where id=$namePower[plugin_genericobject_powertypes_id]");
                $resurse->execute();
                $typePower=$resurse->fetch(PDO::FETCH_ASSOC);

                echo $typePower['name'];
                echo " ";
                echo $namePower['name'];
                echo " ";
                echo $modelPower['name'];
                if ($namePower['contact']!=0)
                {
                    echo " ".$namePower['contact']."";
                }

                $resurse = $PdoConnect->prepare("Select * from `glpi_groups` where id=$namePower[groups_id]");
                $resurse->execute();
                $group=$resurse->fetch(PDO::FETCH_ASSOC);
                echo " (".$group['name'].")";
               echo "<br>";
            }
            echo "</td>";

            //Вывод ПО
            echo "<td style='white-space: nowrap;'>";
            $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_operationsystems` where users_id=$res[users_id]");
            $resurse->execute();
            $nameOperationsystems=$resurse->fetchAll(PDO::FETCH_ASSOC);
            foreach($nameOperationsystems as $nameOperationsystem)
            {

                $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_operationsystemmodels` where id=$nameOperationsystem[plugin_genericobject_operationsystemmodels_id]");
                $resurse->execute();
                $modelOperationsystem=$resurse->fetch(PDO::FETCH_ASSOC);

                echo $nameOperationsystem['name'];
                echo " ";
                echo $modelOperationsystem['name'];

                $resurse = $PdoConnect->prepare("Select * from `glpi_groups` where id=$nameOperationsystem[groups_id]");
                $resurse->execute();
                $group=$resurse->fetch(PDO::FETCH_ASSOC);
                echo " (".$group['name'].")";
               echo "<br>";
            }
            echo "</td>";




            //Вывод Apple
            echo "<td style='white-space: nowrap;'>";
            $resurse = $PdoConnect->prepare("Select * from `glpi_plugin_genericobject_apples` where users_id=$res[users_id]");
            $resurse->execute();
            $nameApples=$resurse->fetchAll(PDO::FETCH_ASSOC);
            foreach($nameApples as $nameApple)
            {
                echo $nameApple['name'];
                echo "<br>";
                $resurse = $PdoConnect->prepare("Select * from `glpi_groups` where id=$nameApple[groups_id]");
                $resurse->execute();
                $group=$resurse->fetch(PDO::FETCH_ASSOC);
                echo " (".$group['name'].")";
            }
            echo "</td>";
            echo "</tr>";
            }

            echo "</table>";
        }

}

