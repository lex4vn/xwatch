<?php  echo $header; ?> <?php require( ThemeControlHelper::getLayoutPath( 'common/mass-header.tpl' )  ); ?>
<div class="main-columns container space-20">

    <div class="container-inside">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="row"><?php if( $SPAN[0] ): ?>
            <aside id="sidebar-left" class="col-md-<?php echo $SPAN[0];?>">
                <?php echo $column_left; ?>
            </aside>
            <?php endif; ?>

            <div id="sidebar-main" class="col-md-<?php echo $SPAN[1];?>"><div id="content" class="space-padding-0">

                    <?php echo $content_top; ?>
                    <h1 class="page-title"><?php echo $heading_title; ?></h1>
                    <div class="style-panel">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title"><?php echo $text_guest; ?></h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapse-checkout-confirm">
                                <div class="panel-body"></div>
                            </div>
                        </div>
                    </div><?php echo $content_bottom; ?></div>
            </div>
            <?php if( $SPAN[2] ): ?>
            <aside id="sidebar-right" class="col-md-<?php echo $SPAN[2];?>">
                <?php echo $column_right; ?>
            </aside>
            <?php endif; ?></div>
    </div>
</div>

