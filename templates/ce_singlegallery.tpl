
<!-- indexer::stop -->
<div id="simplegallery<?php echo $this->id; ?>" class="<?php echo $this->class; ?> block"<?php echo $this->cssID; ?><?php if ($this->style): ?> style="<?php echo $this->style; ?>"<?php endif; ?>>
<?php if ($this->headline): ?>

<<?php echo $this->hl; ?>><?php echo $this->headline; ?></<?php echo $this->hl; ?>>
<?php endif; ?>

<?php foreach( $this->images as $image ): ?>
<div class="image_container">
<?php if ($this->fullsize): ?><a href="<?php echo $image['href']; ?>" title="<?php echo $image['caption']; ?>" rel="lightbox[<?php echo $this->lightboxid; ?>]"><?php endif; ?><img src="<?php echo $image['src']; ?>" alt="<?php echo $image['alt']; ?>" /><?php if ($this->fullsize) echo '</a>'; ?>
<div class="caption"><?php echo $image['caption']; ?></div>
</div>
<?php endforeach; ?>

<a href="#" class="previous" style="display:none"><< Vorheriges Bild</a>
<a href="#" class="next" style="display:none">Nächstes Bild >></a>
<div class="counter" style="display:none"><?php echo sprintf($this->counter, 1).count($this->images); ?></div>

</div>

<script type="text/javascript">
<!--//--><![CDATA[//><!--
window.addEvent('domready', function()
{
	$$('#simplegallery<?php echo $this->id; ?> .image_container').each( function(el, i) {
		if (i > 0) el.setStyle('display', 'none');
	});
	
	$$('#simplegallery<?php echo $this->id; ?> .previous').setStyle('display', 'block').addEvent('click', function(event) {
	
		var found=false;
		
		$$('#simplegallery<?php echo $this->id; ?> .image_container').each( function(el, i, images) {
		
			if (found) return;
			
			if (el.getStyle('display') == 'block')
			{
				found = true;
				el.setStyle('display', 'none');

				if (i == 0)
				{
					images[(images.length-1)].setStyle('display', 'block');
					$$('#simplegallery<?php echo $this->id; ?> .counter').set('text', ('<?php echo $this->counter; ?>'.replace('%s', images.length)+images.length));
				} else {
					images[(i-1)].setStyle('display', 'block');
					$$('#simplegallery<?php echo $this->id; ?> .counter').set('text', ('<?php echo $this->counter; ?>'.replace('%s', i)+images.length));
				}
			}
		});
		
		return false;
	});
	
	$$('#simplegallery<?php echo $this->id; ?> .next').setStyle('display', 'block').addEvent('click', function(event) {
	
		var found=false;
		
		$$('#simplegallery<?php echo $this->id; ?> .image_container').each( function(el, i, images) {
		
			if (found) return;
			
			if (el.getStyle('display') == 'block')
			{
				found = true;
				el.setStyle('display', 'none');

				if ((i+1) == images.length)
				{
					images[0].setStyle('display', 'block');
					$$('#simplegallery<?php echo $this->id; ?> .counter').set('text', ('<?php echo $this->counter; ?>'.replace('%s', 1)+images.length));
				} else {
					images[(i+1)].setStyle('display', 'block');
					$$('#simplegallery<?php echo $this->id; ?> .counter').set('text', ('<?php echo $this->counter; ?>'.replace('%s', i+2)+images.length));
				}
			}
		});
		
		return false;
	});
	
	$$('#simplegallery<?php echo $this->id; ?> .counter').setStyle('display', 'block');
});
//--><!]]>
</script>

<!-- indexer::continue -->