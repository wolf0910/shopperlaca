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

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_users' || $_REQUEST['page']=='create_user') echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class="fa fa-lg fa-fw fa-user"></i>Cài đặt tùy chỉnh 
                            </a>
                            <ul class="nav-sub">
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_users') echo 'active open';} ?>'>
                                    <a href="?page=list_users" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Danh Sách Tài Khoản
                                    </a>
                                </li>
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='create_user') echo 'active open';} ?>'>
                                    <a href="?page=create_user" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Thêm Tài Khoản
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='order_new' || $_REQUEST['page']=='delivery' || $_REQUEST['page']=='completed') echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class="fa fa-lg fa-fw fa-user"></i>Quản lý đơn hàng 
                            </a>
                            <ul class="nav-sub">
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='order_new') echo 'active open';} ?>'>
                                    <a href="?page=order_new" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Đơn Hàng Mới
                                    </a>
                                </li>
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='delivery') echo 'active open';} ?>'>
                                    <a href="?page=delivery" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Đơn Hàng Đang Giao
                                    </a>
                                </li>
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='completed') echo 'active open';} ?>'>
                                    <a href="?page=completed" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Đơn Hàng Hoàn Tất
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_product' || $_REQUEST['page']=='create_product') echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class="fa fa-lg fa-fw fa-user"></i>Quản lý sản phẩm  
                            </a>
                            <ul class="nav-sub">
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_product') echo 'active open';} ?>'>
                                    <a href="?page=list_product" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Danh Sách Sản Phẩm
                                    </a>
                                </li>
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='create_product') echo 'active open';} ?>'>
                                    <a href="?page=create_product" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Thêm Sản Phẩm
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_category' || $_REQUEST['page']=='create_category') echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class="fa fa-lg fa-fw fa-user"></i>Quản lý Danh Mục  
                            </a>
                            <ul class="nav-sub">
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_category') echo 'active open';} ?>'>
                                    <a href="?page=list_category" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Danh Sách Danh Mục
                                    </a>
                                </li>
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='create_category') echo 'active open';} ?>'>
                                    <a href="?page=create_category" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Thêm Danh Mục
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_TonKho') echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class="fa fa-lg fa-fw fa-user"></i>Quản lý Tồn Kho  
                            </a>
                            <ul class="nav-sub">
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_TonKho') echo 'active open';} ?>'>
                                    <a href="?page=list_TonKho" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Danh Sách Tồn Kho
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_customsr') echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class="fa fa-lg fa-fw fa-user"></i>Quản lý khách hàng  
                            </a>
                            <ul class="nav-sub">
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='list_customsr') echo 'active open';} ?>'>
                                    <a href="?page=list_customsr" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Danh Sách Khách Hàng
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='purchase_history' || $_REQUEST['page']=='inventory_day' || $_REQUEST['page']=='inventory_month' || $_REQUEST['page']=='inventory_year') echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class="fas fa-chart-bar"></i></i>Thống kê  
                            </a>
                            <ul class="nav-sub">
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='inventory_day') echo 'active open';} ?>'>
                                    <a href="?page=inventory_day" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Tồn Kho Theo Ngày
                                    </a>
                                </li>
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='inventory_month') echo 'active open';} ?>'>
                                    <a href="?page=inventory_month" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Tồn Kho Theo Tháng
                                    </a>
                                </li>
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='inventory_year') echo 'active open';} ?>'>
                                    <a href="?page=inventory_year" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i>Tồn Kho Theo Năm
                                    </a>
                                </li>
                            </ul>
                        </li>                       
                </nav>
            </aside>