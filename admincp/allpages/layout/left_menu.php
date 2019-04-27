<aside class="sidebar sidebar-default">
                <div class="sidebar-profile">
                    <img class="img-circle profile-image" src="../<?php echo $_SESSION['administrator_avatar']; ?>">

                    <div class="profile-body">
                        <h4><?php echo $_SESSION['administrator_name']; ?></h4>

                        <div class="sidebar-user-links">
                          
                          
                          <!--   <a class="btn btn-link btn-xs" href="../admin_template/javascript:;"       data-placement="bottom" data-toggle="tooltip" data-original-title="Settings"><i class="fa fa-cog"></i></a> -->
                            <a class="btn btn-link btn-xs" href="logout.php" data-placement="bottom" data-toggle="tooltip" data-original-title="Logout"> <i class="fas fa-sign-out-alt"></i> </a>
                        </div>
                    </div>
                </div>
                <nav>
                    <h5 class="sidebar-header">Menu</h5>
                    <ul class="nav nav-pills nav-stacked">
                        <li class="<?php if( isset($_REQUEST['page']) ){if($_REQUEST['page']=='dashboard') echo 'active';} else { echo 'active';} ?>">
                            <a href="?page=dashboard" title="Disabled">
                                <i class="fa fa-lg fa-fw fa-th"></i> Bảng điều khiển
                            </a>
                        </li>

                        <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_order') echo 'active';} ?>">
                            <a href="?page=crud_order" title="Disabled">
                                <i class="fas fa-file-invoice"></i> Đơn đặt hàng
                            </a>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_agent' || $_REQUEST['page']=='import_export_agent') echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class="fas fa-store"></i> Đại lý bán lẻ
                            </a>
                            <ul class="nav-sub">
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_agent') echo 'active open';} ?>'>
                                    <a href="?page=crud_agent" title="Members">
                                        <i class="fas fa-store"></i> Quản lý đại lý
                                    </a>
                                </li>
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='import_export_agent') echo 'active open';} ?>'>
                                    <a href="?page=import_export_agent" title="Profile">
                                        <i class="fas fa-cloud-upload-alt"></i> Import/Export Đại lý bán lẻ
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_customer' || $_REQUEST['page']=='import_export_customer' ) echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class="fas fa-users"></i> Khách hàng
                            </a>
                            <ul class="nav-sub">
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_customer') echo 'active';} ?>">
                                    <a href="?page=crud_customer" title="Members">
                                        <i class="fas fa-users"></i> Quản lý khách hàng
                                    </a>
                                </li>
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='import_export_customer') echo 'active open';} ?>">
                                    <a href="?page=import_export_customer" title="Profile">
                                        <i class="fas fa-cloud-upload-alt"></i> Import/Export khách hàng
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_admin' || $_REQUEST['page']=='import_export_admin' ) echo 'active open';} ?> ">
                            <a href="#" title="Users">
                                <i class="fas fa-user-tie"></i> Admin
                            </a>
                            <ul class="nav-sub">
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_admin') echo 'active';} ?>">
                                    <a href="?page=crud_admin" title="Members">
                                        <i class="fas fa-user-tie"></i> Quản lý Admin
                                    </a>
                                </li>
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='import_export_admin') echo 'active';} ?>">
                                    <a href="?page=import_export_admin" title="Profile">
                                        <i class="fas fa-cloud-upload-alt"></i> Import/Export Admin
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_category' || $_REQUEST['page']=='crud_product' || $_REQUEST['page']=='crud_producer') echo 'active open';} ?> ">
                            <a href="#" title="Users">
                                <i class="fas fa-boxes"></i> Sản phẩm
                            </a>
                            <ul class="nav-sub">
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_product') echo 'active';} ?>">
                                    <a href="?page=crud_product" title="Members">
                                        <i class="fas fa-boxes"></i> Quản lý Sản phẩm
                                    </a>
                                </li>
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_category') echo 'active';} ?>">
                                    <a href="?page=crud_category" title="Profile">
                                        <i class="fas fa-th-list"></i> Danh mục
                                    </a>
                                </li>
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_producer') echo 'active';} ?>">
                                    <a href="?page=crud_producer" title="Profile">
                                        <i class="fas fa-industry"></i> Nhà sản xuất
                                    </a>
                                </li>

                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='customers_statistic' || $_REQUEST['page']=='agent_statistic' || $_REQUEST['page']=='agents_statistic' ) echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class="fas fa-chart-bar"></i> Thống kê
                                <!-- <span class="label label-danger pull-right">New</span> -->
                            </a>
                            <ul class="nav-sub">
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='customers_statistic') echo 'active';} ?>">
                                    <a href="?page=customers_statistic" title="Message">
                                        <i class="fas fa-align-left"></i> Thống kê danh sách khách hàng
                                    </a>
                                </li>
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='agents_statistic') echo 'active';} ?>">
                                    <a href="?page=agents_statistic" title="Compose">
                                        <i class="fas fa-align-left"></i> Thống kê danh sách đại lý
                                    </a>
                                </li>
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='agent_statistic') echo 'active';} ?>">
                                    <a href="?page=agent_statistic" title="Compose">
                                        <i class="fas fa-chart-bar"></i> Thống kê chi tiết đại lý
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_slider') echo 'active';} ?>">
                            <a href="?page=crud_slider" title="Disabled">
                                <i class="fas fa-images"></i> Slider
                            </a>
                        </li>

                </nav>
            </aside>