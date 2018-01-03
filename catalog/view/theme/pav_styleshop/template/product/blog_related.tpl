<?php if (!empty($blog)) { ?>	
<?php //echo "<pre>";print_r($blog);die(); ?>
<?php 	
$cols = 5;
$span = 12/$cols;

?>
<div class="box product-related clearfix">	
	<div class="box-heading heighlight">
		<span><?php echo $tab_blog_related; ?> (<?php echo count($blog); ?>)</span>
	</div>
	<div class="blog_related heighlight" id="blog_related">
		<ul>
			<?php foreach ($blog as $value): ?>
				<li class="clearfix"><a href="">
					<?php if($value['image']){ ?>
						<img src="./image/<?= $value['image'] ?>" alt="" width="25px" height="15px">
					<?php }else{ ?>
						<img src="./image/data/pavblog/article.png" alt="" width="30px">
					<?php } ?>
					<span><?= $value['title'] ?></span>
				</a></li>
				
			<?php endforeach ?>
			
		</ul>
	</div>


</div>	
<?php } ?>