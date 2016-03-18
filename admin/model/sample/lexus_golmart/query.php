<?php 

$query['pavmegamenu'][]  = "DELETE FROM `".DB_PREFIX ."setting` WHERE `code`='pavmegamenu' and `key` = 'pavmegamenu_module'";

$query['pavmegamenu'][]  = "DELETE FROM `".DB_PREFIX ."setting` WHERE `code`='pavmegamenu_params' and `key` = 'params'";
$query['pavmegamenu'][] =  " 
INSERT INTO `".DB_PREFIX ."setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(0, 0, 'pavmegamenu_params', 'pavmegamenu_params', '[{\"id\":43,\"group\":0,\"cols\":1,\"submenu\":1,\"align\":\"aligned-left\",\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]},{\"submenu\":1,\"subwidth\":1170,\"id\":55,\"align\":\"aligned-fullwidth\",\"group\":0,\"cols\":1,\"rows\":[{\"cols\":[{\"widgets\":\"wid-60|wid-66\",\"colwidth\":3},{\"widgets\":\"wid-61|wid-67\",\"colwidth\":3},{\"widgets\":\"wid-62\",\"colwidth\":3},{\"widgets\":\"wid-63\",\"colwidth\":3}]}]},{\"id\":57,\"group\":0,\"cols\":1,\"subwidth\":800,\"submenu\":1,\"align\":\"aligned-center\",\"rows\":[{\"cols\":[{\"widgets\":\"wid-68\",\"colwidth\":3},{\"widgets\":\"wid-69\",\"colwidth\":3},{\"widgets\":\"wid-70\",\"colwidth\":3},{\"widgets\":\"wid-71\",\"colwidth\":3}]}]},{\"id\":2,\"group\":0,\"cols\":3,\"subwidth\":900,\"submenu\":1,\"align\":\"aligned-center\",\"rows\":[{\"cols\":[{\"widgets\":\"wid-55\",\"colwidth\":6},{\"widgets\":\"wid-57\",\"colwidth\":6}]}]},{\"id\":19,\"group\":0,\"cols\":1,\"submenu\":1,\"align\":\"aligned-left\",\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]},{\"id\":23,\"group\":0,\"cols\":1,\"submenu\":1,\"align\":\"aligned-left\",\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]},{\"id\":29,\"group\":0,\"cols\":1,\"submenu\":1,\"align\":\"aligned-left\",\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]}]', 0);
";

$query['pavverticalmenu'][]  = "DELETE FROM `".DB_PREFIX ."setting` WHERE `code`='pavverticalmenu_params' and `key` = 'params'";
$query['pavverticalmenu'][] ="INSERT INTO `".DB_PREFIX ."setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(0, 0, 'pavverticalmenu_params', 'params', '[{\"submenu\":1,\"subwidth\":700,\"id\":7,\"group\":0,\"cols\":1,\"rows\":[{\"cols\":[{\"widgets\":\"wid-70|wid-71\",\"colwidth\":\"5\"},{\"widgets\":\"wid-72\",\"colwidth\":\"5\"}]},{\"cols\":[{\"widgets\":\"wid-73\",\"colwidth\":\"5\"},{\"widgets\":\"wid-74\",\"colwidth\":\"5\"}]}]},{\"id\":2,\"group\":0,\"cols\":3,\"subwidth\":600,\"submenu\":1,\"rows\":[{\"cols\":[{\"widgets\":\"wid-60\",\"colwidth\":12}]}]},{\"id\":5,\"group\":0,\"cols\":1,\"subwidth\":700,\"submenu\":1,\"rows\":[{\"cols\":[{\"widgets\":\"wid-20|wid-22|wid-58\",\"colwidth\":3},{\"widgets\":\"wid-21\",\"colwidth\":9,\"colclass\":\"\"}]}]}]', 0);
";

$query['pavblog'][] ="
INSERT INTO `".DB_PREFIX ."layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(228, 14, 0, 'pavblog/%');

";
$query['pavblog'][] ="
INSERT INTO `".DB_PREFIX ."layout` (`layout_id`, `name`) VALUES
(14, 'Pav Blog');
";
?>