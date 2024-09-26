<?php
/* Smarty version 4.3.1, created on 2024-06-29 15:24:26
  from '/var/www/html/MAIN/ui/ui/customers-add.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_667ffcfab2d9b3_48190248',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '35a4117992c01237b7cda5c6a3842fe4bb6e3a70' => 
    array (
      0 => '/var/www/html/MAIN/ui/ui/customers-add.tpl',
      1 => 1718801614,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:sections/header.tpl' => 1,
    'file:sections/footer.tpl' => 1,
  ),
),false)) {
function content_667ffcfab2d9b3_48190248 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:sections/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<form class="form-horizontal" method="post" role="form" action="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
customers/add-post">
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-primary panel-hovered panel-stacked mb30">
                <div class="panel-heading"><?php echo Lang::T('Add New Contact');?>
</div>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-md-3 control-label"><?php echo Lang::T('Username');?>
</label>
                        <div class="col-md-9">
                            <div class="input-group">
                               <input type="text" class="form-control" name="username" required placeholder="<?php echo Lang::T('Enter Account Number');?>
" 
           value="AC2024<?php echo rand(100,999);?>
" autocomplete="off" onmouseleave="this.type = 'text'" onmouseenter="this.type = 'text'">
				</div> 
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"><?php echo Lang::T('Full Name');?>
</label>
                        <div class="col-md-9">
                            <input type="text" required class="form-control" id="fullname" name="fullname">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"><?php echo Lang::T('Email');?>
</label>
                        <div class="col-md-9">
                            <input type="email" class="form-control" id="email" name="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"><?php echo Lang::T('Phone Number');?>
</label>
                        <div class="col-md-9">
                            <div class="input-group">
                                <?php if ($_smarty_tpl->tpl_vars['_c']->value['country_code_phone'] != '') {?>
                                    <span class="input-group-addon" id="basic-addon1">+</span>
                                <?php } else { ?>
                                    <span class="input-group-addon" id="basic-addon1"><i
                                            class="glyphicon glyphicon-phone-alt"></i></span>
                                <?php }?>
                                <input type="text" class="form-control" name="phonenumber"
                                    placeholder="<?php if ($_smarty_tpl->tpl_vars['_c']->value['country_code_phone'] != '') {
echo $_smarty_tpl->tpl_vars['_c']->value['country_code_phone'];
}?> <?php echo Lang::T('Phone Number');?>
">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"><?php echo Lang::T('Password');?>
</label>
                        <div class="col-md-9">
                            <input type="password" class="form-control" autocomplete="off" required id="password"
                                value="<?php echo rand(000000,999999);?>
" name="password" onmouseleave="this.type = 'password'"
                                onmouseenter="this.type = 'text'">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"><?php echo Lang::T('PPPOE Password');?>
</label>
                        <div class="col-md-9">
                            <input type="password" class="form-control" id="pppoe_password" name="pppoe_password"
                                value="<?php echo $_smarty_tpl->tpl_vars['d']->value['pppoe_password'];?>
" onmouseleave="this.type = 'password'"
                                onmouseenter="this.type = 'text'">
                            <span class="help-block">
                                <?php echo Lang::T('User Cannot change this, only admin. if it Empty it will use user password');?>

                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"><?php echo Lang::T('Address');?>
</label>
                        <div class="col-md-9">
                            <textarea name="address" id="address" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"><?php echo Lang::T('Service Type');?>
</label>
                        <div class="col-md-9">
                            <select class="form-control" id="service_type" name="service_type">
                                <option value="Hotspot">Hotspot
                                </option>
                                <option value="PPPoE">PPPoE</option>
                                <option value="Others">Others</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"><?php echo Lang::T('Account Type');?>
</label>
                        <div class="col-md-9">
                            <select class="form-control" id="account_type" name="account_type">
                                <option value="Personal">Personal
                                </option>
                                <option value="Business">Business</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"><?php echo Lang::T('Coordinates');?>
</label>
                        <div class="col-md-9">
                            <input name="coordinates" id="coordinates" class="form-control" value=""
                                placeholder="6.465422, 3.406448">
                                <div id="map" style="width: '100%'; height: 200px; min-height: 150px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-primary panel-hovered panel-stacked mb30">
                <div class="panel-heading"><?php echo Lang::T('Attributes');?>
</div>
                <div class="panel-body">
                    <!-- Customers Attributes add start -->
                    <div id="custom-fields-container">
                    </div>
                    <!-- Customers Attributes add end -->
                </div>
                <div class="panel-footer">
                    <button class="btn btn-success btn-block" type="button"
                        id="add-custom-field"><?php echo Lang::T('Add');?>
</button>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="box box-primary box-solid collapsed-box">
                <div class="box-header with-border">
                    <h3 class="box-title"><?php echo Lang::T('Additional Information');?>
</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
                        </button>
                    </div>
                </div>
                <div class="box-body" style="display: none;">
                    <div class="form-group">
                        <label class="col-md-3 control-label"><?php echo Lang::T('City');?>
</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="city" name="city"
                                value="<?php echo $_smarty_tpl->tpl_vars['d']->value['city'];?>
">
                            <small class="form-text text-muted"><?php echo Lang::T('City of Resident');?>
</small>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"><?php echo Lang::T('District');?>
</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="district" name="district"
                                value="<?php echo $_smarty_tpl->tpl_vars['d']->value['district'];?>
">
                            <small class="form-text text-muted"><?php echo Lang::T('District');?>
</small>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"><?php echo Lang::T('State');?>
</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="state" name="state"
                                value="<?php echo $_smarty_tpl->tpl_vars['d']->value['state'];?>
">
                            <small class="form-text text-muted"><?php echo Lang::T('State of Resident');?>
</small>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"><?php echo Lang::T('Zip');?>
</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="zip" name="zip"
                                value="<?php echo $_smarty_tpl->tpl_vars['d']->value['zip'];?>
">
                            <small class="form-text text-muted"><?php echo Lang::T('Zip Code');?>
</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <center>
        <button class="btn btn-primary" type="submit">
            <?php echo Lang::T('Save Changes');?>

        </button>
        <br><a href="<?php echo $_smarty_tpl->tpl_vars['_url']->value;?>
customers/list" class="btn btn-link"><?php echo Lang::T('Cancel');?>
</a>
    </center>
</form>

    <?php echo '<script'; ?>
 type="text/javascript">
        document.addEventListener("DOMContentLoaded", function() {
            var customFieldsContainer = document.getElementById('custom-fields-container');
            var addCustomFieldButton = document.getElementById('add-custom-field');

            addCustomFieldButton.addEventListener('click', function() {
                var fieldIndex = customFieldsContainer.children.length;
                var newField = document.createElement('div');
                newField.className = 'form-group';
                newField.innerHTML = `
                <div class="col-md-4">
                    <input type="text" class="form-control" name="custom_field_name[]" placeholder="Name">
                </div>
                <div class="col-md-6">
                    <input type="text" class="form-control" name="custom_field_value[]" placeholder="Value">
                </div>
                <div class="col-md-2">
                    <button type="button" class="remove-custom-field btn btn-danger btn-sm">-</button>
                </div>
            `;
                customFieldsContainer.appendChild(newField);
            });

            customFieldsContainer.addEventListener('click', function(event) {
                if (event.target.classList.contains('remove-custom-field')) {
                    var fieldContainer = event.target.parentNode.parentNode;
                    fieldContainer.parentNode.removeChild(fieldContainer);
                }
            });
        });
    <?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
>
        function getLocation() {
            if (window.location.protocol == "https:" && navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                setupMap(51.505, -0.09);
            }
        }

        function showPosition(position) {
            setupMap(position.coords.latitude, position.coords.longitude);
        }

        function setupMap(lat, lon) {
            var map = L.map('map').setView([lat, lon], 13);
            L.tileLayer('https://{s}.basemaps.cartocdn.com/rastertiles/light_all/{z}/{x}/{y}.png', {
                attribution:
                    '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors &copy; <a href="https://carto.com/attributions">CARTO</a>',
                    subdomains: 'abcd',
                    maxZoom: 20
            }).addTo(map);
            var marker = L.marker([lat, lon]).addTo(map);
            map.on('click', function(e){
                var coord = e.latlng;
                var lat = coord.lat;
                var lng = coord.lng;
                var newLatLng = new L.LatLng(lat, lng);
                marker.setLatLng(newLatLng);
                $('#coordinates').val(lat + ',' + lng);
            });
        }
        window.onload = function() {
            getLocation();
        }
    <?php echo '</script'; ?>
>



<?php $_smarty_tpl->_subTemplateRender("file:sections/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
