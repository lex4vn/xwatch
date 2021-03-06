<?php 
/******************************************************
 * @package Pav blog module for Opencart 1.5.x
 * @version 1.0
 * @author http://www.pavothemes.com
 * @copyright	Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/

/**
 * class ModelPavblogblog 
 */
class ModelPavblogblog extends Model { 
	function getExtensions($type) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "extension WHERE `type` = '" . $this->db->escape($type) . "'");
		return $query->rows;
	}
	public function getList( $data, $filter=array() ){
		
		$query = 'SELECT b.*,bd.title FROM '.DB_PREFIX."pavblog_blog b LEFT JOIN ".DB_PREFIX."pavblog_blog_description bd ON b.blog_id=bd.blog_id LEFT JOIN "
				.DB_PREFIX.'pavblog_category c ON c.category_id=b.category_id';
				
		$query .=" WHERE language_id=".(int)$this->config->get('config_language_id');
		if( isset($filter['title']) && ($filter['title']) ){
			$query .= ' AND bd.title like "%'.$this->db->escape($filter['title']).'%"';
		}
		if( isset($filter['category_id']) && (int)$filter['category_id'] > 1 ){
			$query .= ' AND b.category_id='.$filter['category_id'];
		}
		
		$query .= " ORDER BY b.date_modified  DESC";		
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}				

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
		 
			$query .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
			
		$query = $this->db->query( $query );
		$blogs = $query->rows;
		return $blogs; 
	}
	
	public function getBlogs($filter=array() ){
		
		$query = 'SELECT b.*,bd.title FROM '.DB_PREFIX."pavblog_blog b LEFT JOIN ".DB_PREFIX."pavblog_blog_description bd ON b.blog_id=bd.blog_id LEFT JOIN "
				.DB_PREFIX.'pavblog_category c ON c.category_id=b.category_id';
				
		$query .=" WHERE language_id=".(int)$this->config->get('config_language_id');
		if( isset($filter['title']) && ($filter['title']) ){
			$query .= ' AND bd.title like "%'.$this->db->escape($filter['title']).'%"';
		}

		
		if (isset($filter_data['start']) || isset($filter_data['limit'])) {
			if ($filter_data['start'] < 0) {
				$filter_data['start'] = 0;
			}				

			if ($filter_data['limit'] < 1) {
				$filter_data['limit'] = 20;
			}	
		 
			$query .= " LIMIT " . (int)$filter_data['start'] . "," . (int)$filter_data['limit'];
		}
		$query .= " ORDER BY b.date_modified";	
			
		$query = $this->db->query( $query );
		$blogs = $query->rows;
		return $blogs; 
	}
	
	public function getTotal( $data, $filter=array() ){
		$query = 'SELECT count(b.blog_id) as total FROM '.DB_PREFIX."pavblog_blog b LEFT JOIN ".DB_PREFIX."pavblog_blog_description bd ON b.blog_id=bd.blog_id LEFT JOIN "
				.DB_PREFIX.'pavblog_category c ON c.category_id=b.category_id';
				
		$query .=" WHERE language_id=".(int)$this->config->get('config_language_id');
		if( isset($filter['title']) && ($filter['title']) ){
			$query .= ' AND bd.title like "%'.$this->db->escape($filter['title']).'%"';
		}
		if( isset($filter['category_id']) && (int)$filter['category_id'] > 1 ){
			$query .= ' AND b.category_id='.$filter['category_id'];
		}
		
		$query = $this->db->query( $query );
		$blogs = $query->row;
		return $blogs['total']; 
	}

	/**
	 *
	 */
	public function getBlog( $blogId ){
		$query = 'SELECT b.* FROM '.DB_PREFIX."pavblog_blog b LEFT JOIN "
					.DB_PREFIX.'pavblog_category c ON c.category_id=b.category_id';
		$query .= " WHERE b.blog_id=".$blogId;			

		$query = $this->db->query( $query ); 	
		$data = array();
		$data['blog'] = $query->row;
		
		$sql = "SELECT * FROM ".DB_PREFIX."pavblog_blog_description WHERE blog_id=".$blogId;
		$query = $this->db->query( $sql ); 	
		$languages = array();
		foreach( $query->rows as $language ){
			$languages[$language['language_id']] = $language;
		}
		$data['blog_description'] = $languages;
		return $data;
	}
	
	public function getBlogMeta( $blogId ){
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'blog_id=" . (int)$blogId . "')	AS keyword FROM " . DB_PREFIX . "pavblog_blog p LEFT JOIN " . DB_PREFIX . "pavblog_blog_description pd ON (p.blog_id = pd.blog_id) WHERE p.blog_id = '" . (int)$blogId . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}
	
	public function getProductRelated($blogId) {
		$product_related_data = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "pavblog_product_related WHERE blog_id = '" . (int)$blogId . "'");
		foreach ($query->rows as $result) {
			$product_related_data[] = $result['related_id'];
		}
		return $product_related_data;
	}
	
	public function getBlogRelated($blogId) {
		$blog_related_data = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "pavblog_blog_related WHERE blog_id = '" . (int)$blogId . "'");
		foreach ($query->rows as $result) {
			$blog_related_data[] = $result['related_id'];
		}
		return $blog_related_data;
	}

	/**
	 *
	 */
	public function saveData( $data ){
		$this->load->model('pavblog/seo');

		if( $data["pavblog_blog"] ){
			if(  (int)$data['pavblog_blog']['blog_id'] > 0 ){
				$sql = " UPDATE  ". DB_PREFIX . "pavblog_blog SET  ";
				$tmp = array();
				foreach( $data["pavblog_blog"] as $key => $value ){
					if( $key != "blog_id" ){
						$tmp[] = "`".$key."`='".$this->db->escape($value)."'";
					}
				}
				$tmp[]=" date_modified = NOW() ";
				$sql .= implode( " , ", $tmp );
				$sql .= " WHERE blog_id=".$data['pavblog_blog']['blog_id'];
				$this->db->query( $sql );
			} else {
				unset($data["pavblog_blog"]['blog_id']);
		
				$sql = "INSERT INTO ".DB_PREFIX . "pavblog_blog ( `";
				$tmp = array();
				$vals = array();
				foreach( $data["pavblog_blog"] as $key => $value ){
					$tmp[] = $key;
					$vals[]=$this->db->escape($value);
				}				
			 
			 	$sql .= implode("` , `",$tmp)."`) VALUES ('".implode("','",$vals)."') ";
	
				$this->db->query( $sql );
				$data['pavblog_blog']['blog_id'] = $this->db->getLastId();
			}

			if( isset($data['pavblog_blog']['keyword']) && $data['pavblog_blog']['blog_id'] ) {
				$this->model_pavblog_seo->saveKeyword( 'blog_id='.$data['pavblog_blog']['blog_id'], $data['pavblog_blog']['keyword'] );
			}
		}
		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
	
		if( isset($data["pavblog_blog_description"]) ){ 
			
			$sql = " DELETE FROM ".DB_PREFIX ."pavblog_blog_description WHERE blog_id=".(int)$data["pavblog_blog"]['blog_id'] ;
			$this->db->query( $sql );
	 
			foreach( $languages as $language ){
				$sql = "INSERT INTO ".DB_PREFIX ."pavblog_blog_description(`language_id`, `blog_id`,`title`,`description`,`content`) 
							VALUES(".$language['language_id'].",'".$data['pavblog_blog']['blog_id']."','".$this->db->escape($data["pavblog_blog_description"][$language['language_id']]['title'])."','"
							.$this->db->escape($data["pavblog_blog_description"][$language['language_id']]['description'])."','".$this->db->escape($data["pavblog_blog_description"][$language['language_id']]['content'])."') ";
				
				$this->db->query( $sql );					
			}
		}
		
		if (isset($data['product_related'])) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "pavblog_product_related WHERE blog_id = '" . (int)$data["pavblog_blog"]['blog_id'] . "'");
			foreach ($data['product_related'] as $related_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "pavblog_product_related SET blog_id = '" . (int)$data["pavblog_blog"]['blog_id'] . "', related_id = '" . (int)$related_id . "'");
			}
		}
		if (isset($data['blog_related'])) {
			$this->db->query("DELETE FROM " . DB_PREFIX . "pavblog_blog_related WHERE blog_id = '" . (int)$data["pavblog_blog"]['blog_id'] . "'");
			foreach ($data['blog_related'] as $blog_related_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "pavblog_blog_related SET blog_id = '" . (int)$data["pavblog_blog"]['blog_id'] . "', related_id = '" . (int)$blog_related_id . "'");
			}
		}
		return $data['pavblog_blog']['blog_id'];
	}
	
	/**
	 *
	 */
	public function getMostRead(){
		return $this->getList( 15, "hits" );
	}
	
	public function geNewest(){
		return $this->getList( 15 );
	}
	
	/**
	 *
	 */
	public function delete( $id ){  
 
		if( $id ) {
			$sql = " DELETE FROM ".DB_PREFIX."pavblog_blog WHERE blog_id=".(int)$id;	
			$this->db->query( $sql );
			$sql = " DELETE FROM ".DB_PREFIX ."pavblog_blog_description WHERE blog_id=".(int)$id ;
			$this->db->query( $sql );

			$this->load->model('pavblog/seo');
			$this->model_pavblog_seo->delete( 'pavblog/blog='.$id ); 

			return true;
		}		
	}
	
	public function savePublished( $id , $status=1){
		$sql = " UPDATE  ". DB_PREFIX . "pavblog_blog SET `status`=".$status;
		$sql .= " WHERE blog_id=".(int)$id;
		$this->db->query( $sql );
		return $id;
	}
	/**
	 *
	 */
	public function saveAction( $ids, $action ){
		switch( $action ){
			case 'published':
				foreach( $ids as $id ){
					$this->savePublished( $id ,1 );
				}
				break;
			case 'unpublished':
				foreach( $ids as $id ){
					$this->savePublished( $id , 0 );
				}
				break;
			case 'delete':
				foreach( $ids as $id ){
					$this->delete( $id );
				}
		}
		return ;
	}	
	
	public function savePosition( $positions ){
		foreach( $positions as $id => $position ){
			$sql = " UPDATE  ". DB_PREFIX . "pavblog_blog SET `position`=".(int)trim($position);
			$sql .= " WHERE blog_id=".(int)$id;
			
			$this->db->query( $sql );
		}
	}
	
	
}
?>
