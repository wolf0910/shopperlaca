<aside class="sidebar sidebar-default">
                <div class="sidebar-profile">
                    <img class="img-circle profile-image" src="../admin_template/demo/images/profile.jpg">

                    <div class="profile-body">
                        <h4><?php echo $_SESSION['agent_name']  ?></h4>
                    </div>
                </div>
                <nav>
                    <h5 class="sidebar-header">Menu</h5>
                    <ul class="nav nav-pills nav-stacked">
                        <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='dashboards') echo 'active';} ?>">
                            <a href="?page=dashboards" title="Disabled">
                                <i class="fa fa-lg fa-fw fa-th"></i> Dashboards
                            </a>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='order_new' || $_REQUEST['page']=='delivery' || $_REQUEST['page']=='completed') echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class=""></i>Manage Order
                            </a>
                            <ul class="nav-sub">
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='order_new') echo 'active open';} ?>'>
                                    <a href="?page=order_new" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Order New
                                    </a>
                                </li>
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='delivery') echo 'active open';} ?>'>
                                    <a href="?page=delivery" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Order delivery
                                    </a>
                                </li>
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='completed') echo 'active open';} ?>'>
                                    <a href="?page=completed" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Order Completed
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_product' || $_REQUEST['page']=='create_product') echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class=""></i>Manage Product  
                            </a>
                            <ul class="nav-sub">
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_product') echo 'active open';} ?>'>
                                    <a href="?page=list_product" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>List Product
                                    </a>
                                </li>
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='create_product') echo 'active open';} ?>'>
                                    <a href="?page=create_product" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Create Product
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_category' || $_REQUEST['page']=='create_category') echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class=""></i>Manage Category 
                            </a>
                            <ul class="nav-sub">
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_category') echo 'active open';} ?>'>
                                    <a href="?page=list_category" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>List Category
                                    </a>
                                </li>
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='create_category') echo 'active open';} ?>'>
                                    <a href="?page=create_category" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Create Category
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_TonKho') echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class=""></i>Manage Inventory  
                            </a>
                            <ul class="nav-sub">
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_TonKho') echo 'active open';} ?>'>
                                    <a href="?page=list_TonKho" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>List Inventory
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_customsr') echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class=""></i>Manage Customer
                            </a>
                            <ul class="nav-sub">
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_customsr') echo 'active open';} ?>'>
                                    <a href="?page=list_customsr" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>List Customer
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_users' || $_REQUEST['page']=='create_user') echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class=""></i>Setting 
                            </a>
                            <ul class="nav-sub">
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_users') echo 'active open';} ?>'>
                                    <a href="?page=list_users" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>List User
                                    </a>
                                </li>
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='create_user') echo 'active open';} ?>'>
                                    <a href="?page=create_user" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Create User
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='purchase_history' || $_REQUEST['page']=='inventory_day' || $_REQUEST['page']=='inventory_month' || $_REQUEST['page']=='inventory_year') echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class=""></i></i>Statistics  
                            </a>
                            <ul class="nav-sub">
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='inventory_day') echo 'active open';} ?>'>
                                    <a href="?page=inventory_day" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>inventory by day 
                                    </a>
                                </li>
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='inventory_month') echo 'active open';} ?>'>
                                    <a href="?page=inventory_month" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>inventory by month
                                    </a>
                                </li>
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='inventory_year') echo 'active open';} ?>'>
                                    <a href="?page=inventory_year" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>inventory by Year
                                    </a>
                                </li>
                            </ul>
                        </li>                       
                </nav>
            </aside>