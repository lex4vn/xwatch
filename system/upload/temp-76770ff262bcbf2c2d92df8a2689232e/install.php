<?php

// BuyNow OCMOD updater. Created by iSenseLabs - http://isenselabs.com

$this->db->query("DELETE FROM `" . DB_PREFIX . "modification` WHERE `name` LIKE '%BuyNow by iSenseLabs%' AND `version`!='2.2' ");