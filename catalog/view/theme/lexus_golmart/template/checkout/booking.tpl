<?php echo $header; ?>
<div class="container">
<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
</ul>
<?php if ($error_warning) { ?>
<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
</div>
<?php } ?>
<div class="row">
<?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
<?php $class = 'col-sm-6'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php $class = 'col-sm-9'; ?>
<?php } else { ?>
<?php $class = 'col-sm-12'; ?>
<?php } ?>
<div id="content" class="<?php echo $class; ?>">
<?php echo $content_top; ?>
    <div id="row">
    <!-- Cart-->
    <fieldset id="cart">
        <legend><?php echo $text_cart_info; ?></legend>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <div class="table-responsive">
                <table class="table table-bordered bg-white">
                    <thead>
                    <tr>
                        <td class="text-center"><?php echo $column_image; ?></td>
                        <td class="text-center"><?php echo $column_name; ?></td>
                        <td class="text-center"><?php echo $column_model; ?></td>
                        <td class="text-center"><?php echo $column_quantity; ?></td>
                        <td class="text-center"><?php echo $column_price; ?></td>
                        <td class="text-center"><?php echo $column_total; ?></td>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($products as $product) { ?>
                    <tr>
                        <td class="text-center"><?php if ($product['thumb']) { ?>
                            <a href="<?php echo $product['href']; ?>"><img
                                        src="<?php echo $product['thumb']; ?>"
                                        alt="<?php echo $product['name']; ?>"
                                        title="<?php echo $product['name']; ?>" class="img-thumbnail"/></a>
                            <?php } ?></td>
                        <td class="text-center"><a
                                    href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                            <?php if (!$product['stock']) { ?>
                            <span class="text-danger">***</span>
                            <?php } ?>
                            <?php if ($product['option']) { ?>
                            <?php foreach ($product['option'] as $option) { ?>
                            <br/>
                            <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                            <?php } ?>
                            <?php } ?>
                            <?php if ($product['reward']) { ?>
                            <br/>
                            <small><?php echo $product['reward']; ?></small>
                            <?php } ?>
                            <?php if ($product['recurring']) { ?>
                            <br/>
                            <span class="label label-info"><?php echo $text_recurring_item; ?></span>
                            <small><?php echo $product['recurring']; ?></small>
                            <?php } ?></td>
                        <td class="text-center"><?php echo $product['model']; ?></td>
                        <td class="text-center">
                            <div class="input-group btn-block" style="max-width: 200px;">
                                <input type="text" name="quantity[<?php echo $product['key']; ?>]"
                                       value="<?php echo $product['quantity']; ?>" size="1"
                                       class="form-control"/>
                    <span class="input-group-btn">
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>"
                            class="btn btn-default"><i class="fa fa-refresh"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>"
                            class="btn btn-danger" onclick="cart.remove('<?php echo $product['key']; ?>');"><i
                                class="fa fa-times-circle"></i></button></span></div>
                        </td>
                        <td class="text-center"><?php echo $product['price']; ?></td>
                        <td class="text-center"><?php echo $product['total']; ?></td>
                    </tr>
                    <?php } ?>
                    <?php foreach ($vouchers as $vouchers) { ?>
                    <tr>
                        <td></td>
                        <td class="text-center"><?php echo $vouchers['description']; ?></td>
                        <td class="text-center"></td>
                        <td class="text-center">
                            <div class="input-group btn-block" style="max-width: 200px;">
                                <input type="text" name="" value="1" size="1" disabled="disabled"
                                       class="form-control"/>
                                            <span class="input-group-btn"><button type="button" data-toggle="tooltip"
                                                                                  title="<?php echo $button_remove; ?>"
                                                                                  class="btn btn-danger"
                                                                                  onclick="voucher.remove('<?php echo $vouchers['key']; ?>');">
                                                    <i class="fa fa-times-circle"></i></button></span></div>
                        </td>
                        <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                    </tr>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
        </form>

        <div class="row" class="space-padding-20">
            <div class="col-sm-4 col-sm-offset-8">
                <table class="table table-bordered bg-white">
                    <?php foreach ($totals as $total) { ?>
                    <tr>
                        <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                        <td class="text-right"><?php echo $total['text']; ?></td>
                    </tr>
                    <?php } ?>
                </table>
            </div>
        </div>
    </fieldset>
    <!-- End Cart-->

    <!-- Thông tin khách hàng -->
    <form action="<?php echo $booking; ?>" method="post" enctype="multipart/form-data">
    <fieldset id="account">
        <legend><?php echo $text_customer_info; ?></legend>
        <div class="form-group required">
            <label class="control-label" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
            <input type="text" name="firstname" value="<?php echo $firstname; ?>"
                   placeholder="<?php echo $entry_firstname_placeholder; ?>" id="input-payment-firstname" class="form-control"/>
            <?php if ($error_firstname) { ?>
            <div class="text-danger"><?php echo $error_firstname; ?></div>
            <?php } ?>
        </div>
        <div class="form-group required">
            <label class="control-label" for="input-payment-telephone"><?php echo $entry_telephone; ?></label>
            <input type="text" name="telephone" value="<?php echo $telephone; ?>"
                   placeholder="<?php echo $entry_telephone_placeholder; ?>" id="input-payment-telephone" class="form-control"/>
            <?php if ($error_telephone) { ?>
            <div class="text-danger"><?php echo $error_telephone; ?></div>
            <?php } ?>
        </div>
        <div class="form-group required">
            <label class="control-label" for="input-payment-email"><?php echo $entry_email; ?></label>
            <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email_placeholder; ?>"
                   id="input-payment-email" class="form-control"/>
            <?php if ($error_email) { ?>
            <div class="text-danger"><?php echo $error_email; ?></div>
            <?php } ?>
        </div>
        <div class="form-group required">
            <label class="control-label" for="input-address"><?php echo $entry_address; ?></label>
            <input type="text" name="address" value="<?php echo $address; ?>"
                   placeholder="<?php echo $entry_address_placeholder; ?>" id="input-address" class="form-control"/>
            <?php if ($error_email) { ?>
            <div class="text-danger"><?php echo $error_address; ?></div>
            <?php } ?>
        </div>
        <div class="form-group">
            <label class="control-label" for="comment"><?php echo $text_comments; ?></label>
            <textarea name="comment" rows="8" class="form-control" placeholder="<?php echo $text_comments_placeholder; ?>"><?php echo $comment; ?></textarea>
        </div>
    </fieldset>

    <!-- End hông tin khách hàng -->
    </div>

</div>


<div class="buttons">
    <div class="pull-left">
        <input type="submit" value="<?php echo $button_booking; ?>" id="button-booking" class="btn btn-primary"/>
    </div>
</div>
</form>

<?php echo $content_bottom; ?>
</div> <!-- End content -->
<?php echo $column_right; ?>
</div> <!-- End row -->
</div><!-- End container -->

<?php echo $footer; ?>