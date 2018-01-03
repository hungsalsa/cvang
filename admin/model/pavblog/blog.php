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
	// Start lấy danh sách blog liên quan product
	public function getblogs($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "pavblog_blog_description";

		// if (!empty($data['filter_category_id'])) {
		// 	$sql .= " LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)";			
		// }

		// $sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'"; 

		if (!empty($data['title'])) {
			$sql .= " WHERE title LIKE '%" . $this->db->escape($data['title']) . "%'";
		}

		// if (!empty($data['filter_model'])) {
		// 	$sql .= " AND p.model LIKE '" . $this->db->escape($data['filter_model']) . "%'";
		// }

		// if (!empty($data['filter_price'])) {
		// 	$sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
		// }

		// if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
		// 	$sql .= " AND p.quantity = '" . $this->db->escape($data['filter_quantity']) . "'";
		// }

		// if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
		// 	$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		// }

		// $sql .= " GROUP BY p.product_id";

		$sort_data = array(
			'title',
			// 'b.model',
			// 'b.price',
			// 'b.quantity',
			// 'b.status',
			// 'b.sort_order'
		);	

		// if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
		// 	$sql .= " ORDER BY " . $data['sort'];	
		// } else {
		// 	$sql .= " ORDER BY pd.name";	
		// }

		// if (isset($data['order']) && ($data['order'] == 'DESC')) {
		// 	$sql .= " DESC";
		// } else {
		// 	$sql .= " ASC";
		// }

		// if (isset($data['start']) || isset($data['limit'])) {
		// 	if ($data['start'] < 0) {
		// 		$data['start'] = 0;
		// 	}				

		// 	if ($data['limit'] < 1) {
		// 		$data['limit'] = 20;
		// 	}	

		// 	$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		// }	

		$query = $this->db->query($sql);

		return $query->rows;
	}

// END lấy danh sách blog liên quan product

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
	 *Tạo blog liên quan product
	 */
	public function getBlogProduct( $blogId ){
		
		$sql = "SELECT DISTINCT * FROM ".DB_PREFIX."pavblog_blog_description WHERE blog_id=".$blogId;
		$query = $this->db->query( $sql ); 	
		$languages = array();
		
		return $query->row;
	}

	/**
	 *
	 */

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
			// 	echo $sql;die;
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
				$this->model_pavblog_seo->saveKeyword( 'pavblog/blog='.$data['pavblog_blog']['blog_id'], $data['pavblog_blog']['keyword'] );
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
