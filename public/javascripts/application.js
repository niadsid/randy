var addressesLayout, subnetsLayout, networksLayout, sitesLayout, address_rangesLayout, systemsLayout, domain_namesLayout;
var addressesTree, subnetsTree, sitesTree, address_rangesTree, systemsTree;
var addressesGrid, subnetsGrid, networksGrid, sitesGrid, address_rangesGrid, systemsGrid, domain_namesGrid;
var addressesToolbar, subnetsToolbar, networksToolbar, sitesToolbar, address_rangesToolbar;

var myTabbar;

function doOnLoad() {

	myTabbar = new dhtmlXTabBar(document.body, "top");
	myTabbar.setImagePath("../javascripts/imgs/");
	myTabbar.addTab("tab1", "IP Addresses", "140px");
	myTabbar.addTab("tab2", "Subnets", "90px");
	myTabbar.addTab("tab3", "Networks", "100px");
	myTabbar.addTab("tab4", "Sites", "70px");
	myTabbar.addTab("tab5", "Address Ranges", "160px");
	myTabbar.addTab("tab6", "Systems", "90px");
	myTabbar.addTab("tab7", "DNS Host Names", "160px");
	myTabbar.setTabActive("tab1");

	addressesLayout = myTabbar.cells("tab1").attachLayout("3L");
	subnetsLayout = myTabbar.cells("tab2").attachLayout("2U");
	networksLayout = myTabbar.cells("tab3").attachLayout("1C");
	sitesLayout = myTabbar.cells("tab4").attachLayout("2U");
	address_rangesLayout = myTabbar.cells("tab5").attachLayout("3L");
	systemsLayout = myTabbar.cells("tab6").attachLayout("3L");
	domain_namesLayout = myTabbar.cells("tab7").attachLayout("2U");

	addressesLayout.cells("a").setWidth(250);
	addressesLayout.cells("a").setText("Addresses");
	addressesLayout.cells("b").hideHeader();
	addressesLayout.cells("c").setText("Address Details");

	subnetsLayout.cells("a").setWidth(250);
	subnetsLayout.cells("a").setText("Subnets");
	subnetsLayout.cells("b").hideHeader();

	networksLayout.cells("a").hideHeader();

	sitesLayout.cells("a").setWidth(250);
	sitesLayout.cells("a").setText("Sites");
	sitesLayout.cells("b").hideHeader();

	address_rangesLayout.cells("a").setWidth(250);
	address_rangesLayout.cells("a").setText("Address Ranges");
	address_rangesLayout.cells("b").hideHeader();
	address_rangesLayout.cells("c").setText("Address Range Details");

	systemsLayout.cells("a").setWidth(250);
	systemsLayout.cells("a").setText("Systems");
	systemsLayout.cells("b").hideHeader();
	systemsLayout.cells("c").setText("System Details");

	domain_namesLayout.cells("a").setWidth(450);
	domain_namesLayout.cells("a").hideHeader();
	domain_namesLayout.cells("b").setText("Host Name Details");

	addressesTree = addressesLayout.cells("a").attachTree("0");
	addressesTree.setImagePath("../javascripts/imgs/");
	addressesTree.loadXML("../addresses/tree.xml");
	addressesTree.attachEvent("onSelect",exploreAddressesNode);
	addressesToolbar = addressesLayout.cells("b").attachToolbar();
	addressesToolbar.setIconsPath("../javascripts/imgs/");
	addressesToolbar.addButton("add", 1, "Add Address","","");
	addressesToolbar.addButton("delete", 2, "Delete Address","","");
	addressesToolbar.addButton("export", 3, "Export","","");
	addressesToolbar.disableItem("add");
	addressesToolbar.disableItem("delete");
	addressesToolbar.disableItem("export");
	addressesToolbar.attachEvent("onClick", function(id) {
		if (id == "add")
			addAddress();
		else if (id == "delete")
			deleteAddress();
	});
	subnetsTree = subnetsLayout.cells("a").attachTree("0");
	subnetsTree.setImagePath("../javascripts/imgs/");
	subnetsTree.loadXML("../subnets/tree.xml");
	subnetsTree.attachEvent("onSelect",exploreSubnetsNode);
	subnetsToolbar = subnetsLayout.cells("b").attachToolbar();
	subnetsToolbar.setIconsPath("../javascripts/imgs/");
	subnetsToolbar.addButton("add", 1, "Add Subnet","","");
	subnetsToolbar.addButton("delete", 2, "Delete Subnet","","");
	subnetsToolbar.addButton("export", 3, "Export","","");
	subnetsToolbar.disableItem("add");
	subnetsToolbar.disableItem("delete");
	subnetsToolbar.disableItem("export");
	subnetsToolbar.attachEvent("onClick", function(id) {
		if (id == "add")
			addSubnet();
		else if (id == "delete")
			deleteSubnet();
	});
	networksToolbar = networksLayout.cells("a").attachToolbar();
	networksToolbar.setIconsPath("../javascripts/imgs/");
	networksToolbar.addButton("add", 1, "Add Network","","");
	networksToolbar.addButton("delete", 2, "Delete Network","","");
	networksToolbar.addButton("export", 3, "Export","","");
	networksToolbar.disableItem("add");
	networksToolbar.disableItem("delete");
	networksToolbar.disableItem("export");
	networksToolbar.attachEvent("onClick", function(id) {
		if (id == "add")
			addNetwork();
		else if (id == "delete")
			deleteNetwork();
	});
	showNetworksGrid();

	sitesTree = sitesLayout.cells("a").attachTree("0");
	sitesTree.setImagePath("../javascripts/imgs/");
	sitesTree.loadXML("../sites/tree.xml");
	sitesTree.attachEvent("onSelect",exploreSitesNode);
	sitesToolbar = sitesLayout.cells("b").attachToolbar();
	sitesToolbar.setIconsPath("../javascripts/imgs/");
	sitesToolbar.addButton("add", 1, "Add Site","","");
	sitesToolbar.addButton("delete", 2, "Delete Site","","");
	sitesToolbar.addButton("export", 3, "Export","","");
	sitesToolbar.disableItem("add");
	sitesToolbar.disableItem("delete");
	sitesToolbar.disableItem("export");
	sitesToolbar.attachEvent("onClick", function(id) {
		if (id == "add")
			addSite();
		else if (id == "delete")
			deleteSite();
	});
	
	address_rangesTree = address_rangesLayout.cells("a").attachTree("0");
	address_rangesTree.setImagePath("../javascripts/imgs/");
	address_rangesTree.loadXML("../address_ranges/tree.xml");
	address_rangesTree.attachEvent("onSelect",exploreAddress_rangesNode);
	address_rangesToolbar = address_rangesLayout.cells("b").attachToolbar();
	address_rangesToolbar.setIconsPath("../javascripts/imgs/");
	address_rangesToolbar.addButton("add", 1, "Add Address Range","","");
	address_rangesToolbar.addButton("delete", 2, "Delete Address Range","","");
	address_rangesToolbar.addButton("export", 3, "Export","","");
	address_rangesToolbar.disableItem("add");
	address_rangesToolbar.disableItem("delete");
	address_rangesToolbar.disableItem("export");
	address_rangesToolbar.attachEvent("onClick", function(id) {
		if (id == "add")
			addAddress_range();
		else if (id == "delete")
			deleteAddress_range();
	});
	
	systemsTree = systemsLayout.cells("a").attachTree("0");
	systemsTree.setImagePath("../javascripts/imgs/");
	systemsTree.loadXML("../systems/tree.xml");
	systemsTree.attachEvent("onSelect",exploreSystemsNode);
	systemsToolbar = systemsLayout.cells("b").attachToolbar();
	systemsToolbar.setIconsPath("../javascripts/imgs/");
	systemsToolbar.loadXML("../pages/toolbar.xml");

	showDomain_namesGrid();
	domain_namesToolbar = domain_nameLayout.cells("a").attachToolbar();
	domain_namesToolbar.setIconsPath("../javascripts/imgs/");
	domain_namesToolbar.loadXML("../pages/toolbar.xml");
}

//
//	addressesGrid
//

function exploreAddressesNode(node_id) {
	addressesTree.openItem(node_id);
	showAddressesGrid(node_id);
}
function showAddressesGrid(node_id) {
	addressesGrid = addressesLayout.cells("b").attachGrid();
	addressesGrid.setImagePath("../javascripts/imgs/");

	if (node_id == "All IP Addresses" || node_id == "0") {
		addressesToolbar.disableItem("add");
		addressesToolbar.disableItem("delete");
		addressesGrid.setHeader("Network, Site, Subnet, IP Address, Mask, System, Description");
		addressesGrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#select_filter,#text_filter,#text_filter");
		addressesGrid.setSizes();
		addressesGrid.setColSorting("str,str,str,str,int,str,str");
		addressesGrid.setColTypes("ro,ro,ro,ed,ed,ro,ed");
		addressesGrid.enableEditTabOnly(1);
		addressesGrid.setInitWidths("100,100,100,100,50,150,*");
		addressesGrid.setColAlign("center,center,center,right,center,left,left");
		addressesGrid.enableAlterCss("even","uneven");
		addressesGrid.load("../addresses/all_addresses.xml", function() {
			addressesGrid.enableStableSorting(true);
			addressesGrid.sortRows(3,"str","asc");
			addressesGrid.sortRows(2,"str","asc");
			addressesGrid.sortRows(1,"str","asc");
			addressesGrid.sortRows(0,"str","asc");
		});
		/* addressesGrid.attachEvent("onRowDblClicked",function(id){
		 addressesTree.selectItem(id,true);
		 showFileContent(id);
		 }) */
		addressesGrid.attachEvent("onRowSelect", function() {
			addressesToolbar.enableItem("delete")
		});
		addressesGrid.attachEvent("onClearAll",addressesToolbar.disableItem("delete"));

		addressesGrid.init();

		addressesDP = new dataProcessor("../addresses/dbaction_alladdresses.xml");
		addressesDP.init(addressesGrid);
	} else if (node_id.split(" ")[2]) {
		addressesToolbar.enableItem("add");
		addressesToolbar.disableItem("delete");
		addressesGrid.setHeader("IP Address, Mask, System, Description");
		addressesGrid.attachHeader("#text_filter,#select_filter,#text_filter,#text_filter");
		addressesGrid.setSizes();
		addressesGrid.setColSorting("str,int,str,str");
		addressesGrid.setColTypes("ed,ed,ro,ed");
		addressesGrid.enableEditTabOnly(1);
		addressesGrid.setInitWidths("100,50,100,*");
		addressesGrid.setColAlign("right,left,left,left");
		// addressesGrid.enableAlterCss("even_row","odd_row");
		addressesGrid.load("../addresses/addresses_by_subnet.xml?id="+node_id, function() {
			addressesGrid.enableStableSorting(true);
			addressesGrid.sortRows(0,"str","asc");
		});
		/* addressesGrid.attachEvent("onRowDblClicked",function(id){
		 addressesTree.selectItem(id,true);
		 showFileContent(id);
		 }) */
		addressesGrid.attachEvent("onRowSelect", function() {
			addressesToolbar.enableItem("delete")
		});
		addressesGrid.attachEvent("onClearAll",addressesToolbar.disableItem("delete"));

		addressesGrid.init();

		addressesDP = new dataProcessor("../addresses/dbaction.xml?id="+node_id);
		addressesDP.init(addressesGrid);
	} else if (node_id.split(" ")[1]) {
		addressesToolbar.disableItem("add");
		addressesToolbar.disableItem("delete");
		addressesGrid.setHeader("Subnet, IP Address, Mask, System, Description");
		addressesGrid.attachHeader("#text_filter,#text_filter,#select_filter,#text_filter,#text_filter");
		addressesGrid.setSizes();
		addressesGrid.setColSorting("str,str,int,str,str");
		addressesGrid.setColTypes("ro,ed,ed,ro,ed");
		addressesGrid.enableEditTabOnly(1);
		addressesGrid.setInitWidths("100,100,50,100,*");
		addressesGrid.setColAlign("center,right,left,left,left");
		// addressesGrid.enableAlterCss("even_row","odd_row");
		addressesGrid.load("../addresses/addresses_by_site.xml?id="+node_id, function() {
			addressesGrid.enableStableSorting(true);
			addressesGrid.sortRows(1,"str","asc");
			addressesGrid.sortRows(0,"str","asc");
		});
		/* addressesGrid.attachEvent("onRowDblClicked",function(id){
		 addressesTree.selectItem(id,true);
		 showFileContent(id);
		 }) */
		addressesGrid.attachEvent("onRowSelect", function() {
			addressesToolbar.enableItem("delete")
		});
		addressesGrid.attachEvent("onClearAll",addressesToolbar.disableItem("delete"));

		addressesGrid.init();

		addressesDP = new dataProcessor("../addresses/dbaction_sitenode.xml?id="+node_id);
		addressesDP.init(addressesGrid);
	} else {
		addressesToolbar.disableItem("add");
		addressesToolbar.disableItem("delete");
		addressesGrid.setHeader("Site, Subnet, IP Address, Mask, System, Description");
		addressesGrid.attachHeader("#text_filter,#text_filter,#text_filter,#select_filter,#text_filter,#text_filter");
		addressesGrid.setSizes();
		addressesGrid.setColSorting("str,str,str,int,str,str");
		addressesGrid.setColTypes("ro,ro,ed,ed,ro,ed");
		addressesGrid.enableEditTabOnly(1);
		addressesGrid.setInitWidths("100,100,100,50,100,*");
		addressesGrid.setColAlign("center,center,right,left,left,left");
		// addressesGrid.enableAlterCss("even_row","odd_row");
		addressesGrid.load("../addresses/addresses_by_network.xml?id="+node_id, function() {
			addressesGrid.enableStableSorting(true);
			addressesGrid.sortRows(2,"str","asc");
			addressesGrid.sortRows(1,"str","asc");
			addressesGrid.sortRows(0,"str","asc");
		});
		/* addressesGrid.attachEvent("onRowDblClicked",function(id){
		 addressesTree.selectItem(id,true);
		 showFileContent(id);
		 }) */
		addressesGrid.attachEvent("onRowSelect", function() {
			addressesToolbar.enableItem("delete")
		});
		addressesGrid.attachEvent("onClearAll",addressesToolbar.disableItem("delete"));

		addressesGrid.init();

		addressesDP = new dataProcessor("../addresses/dbaction_networknode.xml?id="+node_id);
		addressesDP.init(addressesGrid);
	}
}

function addressClearFilter() {
	addressesGrid.filterBy(0,"");
	addressesGrid._f_rowsBuffer = null;
}

function addAddress() {
	addressClearFilter();
	addressesGrid.addRow(addressesGrid.uid(),['','','',''],0);
	addressesGrid.selectCell(0,0,false,true,true);
	window.setTimeout( function() {
		addressesGrid.editCell();
	},1);
}

function deleteAddress() {
	addressClearFilter();
	addressesGrid.deleteSelectedRows();
}

//
//	subnetsGrid
//

function exploreSubnetsNode(node_id) {
	subnetsTree.openItem(node_id);
	showSubnetsGrid(node_id);
}

function showSubnetsGrid(node_id) {
	subnetsGrid = subnetsLayout.cells("b").attachGrid();
	subnetsGrid.setImagePath("../javascripts/imgs/");

	if (node_id == "All Subnets" || node_id == "0") {
		subnetsToolbar.disableItem("add");
		subnetsToolbar.disableItem("delete");
		subnetsGrid.setHeader("Network, Site, Name, Subnet, Mask, Default Router, Description");
		subnetsGrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#select_filter,#text_filter,#text_filter");
		subnetsGrid.setSizes();
		subnetsGrid.setColSorting("str,str,str,str,int,str,str");
		subnetsGrid.setColTypes("ro,ro,ed,ed,ed,ed,ed");
		subnetsGrid.enableEditTabOnly(1);
		subnetsGrid.setInitWidths("100,100,100,100,50,100,*");
		subnetsGrid.setColAlign("center,center,center,right,left,center,left");
		// subnetsGrid.enableAlterCss("even_row","odd_row");
		subnetsGrid.load("../subnets/all_subnets.xml", function() {
			subnetsGrid.enableStableSorting(true);
			subnetsGrid.sortRows(3,"str","asc");
			subnetsGrid.sortRows(2,"str","asc");
			subnetsGrid.sortRows(1,"str","asc");
			subnetsGrid.sortRows(0,"str","asc");
		});
		/* subnetsGrid.attachEvent("onRowDblClicked",function(id){
		 subnetsTree.selectItem(id,true);
		 showFileContent(id);
		 }) */
		subnetsGrid.attachEvent("onRowSelect", function() {
			subnetsToolbar.enableItem("delete")
		});
		subnetsGrid.attachEvent("onClearAll",subnetsToolbar.disableItem("delete"));

		subnetsGrid.init();

		subnetsDP = new dataProcessor("../subnets/dbaction_allsubnets.xml");
		subnetsDP.init(subnetsGrid);
	} else if (!node_id.split(" ")[1]) {
		subnetsToolbar.disableItem("add");
		subnetsToolbar.disableItem("delete");
		subnetsGrid.setHeader("Site, Name, Subnet, Mask, Default Router, Description");
		subnetsGrid.attachHeader("#text_filter,#text_filter,#text_filter,#select_filter,#text_filter,#text_filter");
		subnetsGrid.setSizes();
		subnetsGrid.setColSorting("str,str,str,int,str,str");
		subnetsGrid.setColTypes("ro,ed,ed,ed,ed,ed");
		subnetsGrid.enableEditTabOnly(1);
		subnetsGrid.setInitWidths("100,100,50,100,100,*");
		subnetsGrid.setColAlign("center,center,right,left,center,left");
		// subnetsGrid.enableAlterCss("even_row","odd_row");
		subnetsGrid.load("../subnets/subnets_by_network.xml?id="+node_id, function() {
			subnetsGrid.enableStableSorting(true);
			subnetsGrid.sortRows(2,"str","asc");
			subnetsGrid.sortRows(1,"str","asc");
			subnetsGrid.sortRows(0,"str","asc");
		});
		/* subnetsGrid.attachEvent("onRowDblClicked",function(id){
		 subnetsTree.selectItem(id,true);
		 showFileContent(id);
		 }) */
		subnetsGrid.attachEvent("onRowSelect", function() {
			subnetsToolbar.enableItem("delete")
		});
		subnetsGrid.attachEvent("onClearAll",subnetsToolbar.disableItem("delete"));

		subnetsGrid.init();

		subnetsDP = new dataProcessor("../subnets/dbaction_networknode.xml?id="+node_id);
		subnetsDP.init(subnetsGrid);
	} else {
		subnetsToolbar.enableItem("add");
		subnetsToolbar.disableItem("delete");
		subnetsGrid.setHeader("Name, Subnet, Mask, Default Router, Description");
		subnetsGrid.attachHeader("#text_filter,#text_filter,#select_filter,#text_filter,#text_filter");
		subnetsGrid.setSizes();
		subnetsGrid.setColSorting("str,str,int,str,str");
		subnetsGrid.setColTypes("ed,ed,ed,ed,ed");
		subnetsGrid.enableEditTabOnly(1);
		subnetsGrid.setInitWidths("100,50,100,100,*");
		subnetsGrid.setColAlign("center,right,left,center,left");
		// subnetsGrid.enableAlterCss("even_row","odd_row");
		subnetsGrid.load("../subnets/subnets_by_site.xml?id="+node_id, function() {
			subnetsGrid.enableStableSorting(true);
			subnetsGrid.sortRows(1,"str","asc");
			subnetsGrid.sortRows(0,"str","asc");
		});
		/* subnetsGrid.attachEvent("onRowDblClicked",function(id){
		 subnetsTree.selectItem(id,true);
		 showFileContent(id);
		 }) */
		subnetsGrid.attachEvent("onRowSelect", function() {
			subnetsToolbar.enableItem("delete")
		});
		subnetsGrid.attachEvent("onClearAll",subnetsToolbar.disableItem("delete"));

		subnetsGrid.init();

		subnetsDP = new dataProcessor("../subnets/dbaction.xml?id="+node_id);
		subnetsDP.init(subnetsGrid);
	}
}

function subnetsClearFilter() {
	subnetsGrid.filterBy(0,"");
	subnetsGrid._f_rowsBuffer = null;
}

function addSubnet() {
	subnetsClearFilter();
	subnetsGrid.addRow(subnetsGrid.uid(),['','','','',''],0);
	subnetsGrid.selectCell(0,0,false,true,true);
	window.setTimeout( function() {
		subnetsGrid.editCell();
	},1);
}

function deleteSubnet() {
	subnetsClearFilter();
	subnetsGrid.deleteSelectedRows();
}

//
//	networksGrid
//

function showNetworksGrid() {
	networksGrid = networksLayout.cells("a").attachGrid();
	networksGrid.setImagePath("../javascripts/imgs/");
	networksGrid.setHeader("Network, Description");
	networksGrid.attachHeader("#text_filter,#text_filter");
	networksGrid.setSizes();
	networksGrid.setColSorting("str,str");
	networksGrid.setColTypes("ed,ed");
	networksGrid.enableEditTabOnly(1);
	networksGrid.setInitWidths("200,*");
	networksGrid.setColAlign("left,left");
	// networksGrid.enableAlterCss("even_row","odd_row");
	networksGrid.load("../networks/data.xml", function() {
		networksGrid.enableStableSorting(true);
		networksGrid.sortRows(0,"str","asc");
	});
	/* networksGrid.attachEvent("onRowDblClicked",function(id){
	 networksTree.selectItem(id,true);
	 showFileContent(id);
	 }) */
	networksToolbar.enableItem("add");
	networksGrid.attachEvent("onRowSelect", function() {
		networksToolbar.enableItem("delete");
	});
	networksGrid.attachEvent("onClearAll",networksToolbar.disableItem("delete"));

	networksGrid.init();

	networksDP = new dataProcessor("../networks/dbaction.xml");
	networksDP.init(networksGrid);
}

function networksClearFilter() {
	networksGrid.filterBy(0,"");
	networksGrid._f_rowsBuffer = null;
}

function addNetwork() {
	networksClearFilter();
	networksGrid.addRow(networksGrid.uid(),['',''],0);
	networksGrid.selectCell(0,0,false,true,true);
	window.setTimeout( function() {
		networksGrid.editCell();
	},1);
}

function deleteNetwork() {
	networksClearFilter();
	networksGrid.deleteSelectedRows();
}

//
//	sitesGrid
//

function exploreSitesNode(node_id) {
	sitesTree.openItem(node_id);
	showSitesGrid(node_id);
}

function showSitesGrid(node_id) {
	sitesGrid = sitesLayout.cells("b").attachGrid();
	sitesGrid.setImagePath("../javascripts/imgs/");

	if (node_id == "All Sites" || node_id == "0") {
		sitesToolbar.disableItem("add");
		sitesToolbar.disableItem("delete");
		sitesGrid.setHeader("Network, Site Name, Description");
		sitesGrid.attachHeader("#text_filter,#text_filter,#text_filter");
		sitesGrid.setSizes();
		sitesGrid.setColSorting("str,str,str");
		sitesGrid.setColTypes("ro,ed,ed");
		sitesGrid.enableEditTabOnly(1);
		sitesGrid.setInitWidths("150,150,*");
		sitesGrid.setColAlign("center,center,left");
		// sitesGrid.enableAlterCss("even_row","odd_row");
		sitesGrid.load("../sites/all_sites.xml", function() {
			sitesGrid.enableStableSorting(true);
			sitesGrid.sortRows(1,"str","asc");
			sitesGrid.sortRows(0,"str","asc");
		});
		/* sitesGrid.attachEvent("onRowDblClicked",function(id){
		 sitesTree.selectItem(id,true);
		 showFileContent(id);
		 }) */
		sitesGrid.attachEvent("onRowSelect", function() {
			sitesToolbar.enableItem("delete")
		});
		sitesGrid.attachEvent("onClearAll",sitesToolbar.disableItem("delete"));

		sitesGrid.init();

		sitesDP = new dataProcessor("../sites/dbaction_allsites.xml");
		sitesDP.init(sitesGrid);
	} else {
		sitesToolbar.enableItem("add");
		sitesToolbar.disableItem("delete");
		sitesGrid.setHeader("Site Name, Description");
		sitesGrid.attachHeader("#text_filter,#text_filter");
		sitesGrid.setSizes();
		sitesGrid.setColSorting("str,str");
		sitesGrid.setColTypes("ed,ed");
		sitesGrid.enableEditTabOnly(1);
		sitesGrid.setInitWidths("150,*");
		sitesGrid.setColAlign("center,left");
		// sitesGrid.enableAlterCss("even_row","odd_row");
		sitesGrid.load("../sites/sites_by_network.xml?id="+node_id, function() {
			sitesGrid.enableStableSorting(true);
			sitesGrid.sortRows(0,"str","asc");
		});
		/* sitesGrid.attachEvent("onRowDblClicked",function(id){
		 sitesTree.selectItem(id,true);
		 showFileContent(id);
		 }) */
		/* sitesGrid.enableStableSorting(true); */
		sitesGrid.attachEvent("onRowSelect", function() {
			sitesToolbar.enableItem("delete")
		});
		sitesGrid.attachEvent("onClearAll",sitesToolbar.disableItem("delete"));

		sitesGrid.init();

		sitesDP = new dataProcessor("../sites/dbaction.xml?id="+node_id);
		sitesDP.init(sitesGrid);
	}
}

function sitesClearFilter() {
	sitesGrid.filterBy(0,"");
	sitesGrid._f_rowsBuffer = null;
}

function addSite() {
	sitesClearFilter();
	sitesGrid.addRow(sitesGrid.uid(),['',''],0);
	sitesGrid.selectCell(0,0,false,true,true);
	window.setTimeout( function() {
		sitesGrid.editCell();
	},1);
}

function deleteSite() {
	sitesClearFilter();
	sitesGrid.deleteSelectedRows();
}

//
//	address_rangesGrid
//

function exploreAddress_rangesNode(node_id) {
	address_rangesTree.openItem(node_id);
	showAddress_rangesGrid(node_id);
}

function showAddress_rangesGrid(node_id) {
	address_rangesGrid = address_rangesLayout.cells("b").attachGrid();
	address_rangesGrid.setImagePath("../javascripts/imgs/");

	if (node_id == "All Address Ranges" || node_id == "0") {
		address_rangesToolbar.disableItem("add");
		address_rangesToolbar.disableItem("delete");
		address_rangesGrid.setHeader("Network, Site, Subnet, First Address, Last Address, Description");
		address_rangesGrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
		address_rangesGrid.setSizes();
		address_rangesGrid.setColSorting("str,str,str,str,str,str");
		address_rangesGrid.setColTypes("ro,ro,ro,ed,ed,ed");
		address_rangesGrid.enableEditTabOnly(1);
		address_rangesGrid.setInitWidths("100,100,100,100,100,*");
		address_rangesGrid.setColAlign("center,center,center,center,center,left");
		// address_rangesGrid.enableAlterCss("even_row","odd_row");
		address_rangesGrid.load("../address_ranges/all_address_ranges.xml", function() {
			address_rangesGrid.enableStableSorting(true);
			address_rangesGrid.sortRows(3,"str","asc");
			address_rangesGrid.sortRows(2,"str","asc");
			address_rangesGrid.sortRows(1,"str","asc");
			address_rangesGrid.sortRows(0,"str","asc");
		});
		/* address_rangesGrid.attachEvent("onRowDblClicked",function(id){
		 address_rangesTree.selectItem(id,true);
		 showFileContent(id);
		 }) */
		address_rangesGrid.attachEvent("onRowSelect", function() {
			address_rangesToolbar.enableItem("delete")
		});
		address_rangesGrid.attachEvent("onClearAll",address_rangesToolbar.disableItem("delete"));

		address_rangesGrid.init();

		address_rangesDP = new dataProcessor("../address_ranges/dbaction_alladdress_ranges.xml");
		address_rangesDP.init(address_rangesGrid);
	} else if (node_id.split(" ")[2]) {
		address_rangesToolbar.enableItem("add");
		address_rangesToolbar.disableItem("delete");
		address_rangesGrid.setHeader("First Address, Last Address, Description");
		address_rangesGrid.attachHeader("#text_filter,#text_filter,#text_filter");
		address_rangesGrid.setSizes();
		address_rangesGrid.setColSorting("str,str,str");
		address_rangesGrid.setColTypes("ed,ed,ed");
		address_rangesGrid.enableEditTabOnly(1);
		address_rangesGrid.setInitWidths("100,100,*");
		address_rangesGrid.setColAlign("center,center,left");
		// address_rangesGrid.enableAlterCss("even_row","odd_row");
		address_rangesGrid.load("../address_ranges/address_ranges_by_subnet.xml?id="+node_id, function() {
			address_rangesGrid.enableStableSorting(true);
			address_rangesGrid.sortRows(0,"str","asc");
		});
		/* address_rangesGrid.attachEvent("onRowDblClicked",function(id){
		 address_rangesTree.selectItem(id,true);
		 showFileContent(id);
		 }) */
		address_rangesGrid.attachEvent("onRowSelect", function() {
			address_rangesToolbar.enableItem("delete")
		});
		address_rangesGrid.attachEvent("onClearAll",address_rangesToolbar.disableItem("delete"));

		address_rangesGrid.init();

		address_rangesDP = new dataProcessor("../address_ranges/dbaction.xml?id="+node_id);
		address_rangesDP.init(address_rangesGrid);
	} else if (node_id.split(" ")[1]) {
		address_rangesToolbar.disableItem("add");
		address_rangesToolbar.disableItem("delete");
		address_rangesGrid.setHeader("Subnet, First Address, Last Address, Description");
		address_rangesGrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter");
		address_rangesGrid.setSizes();
		address_rangesGrid.setColSorting("str,str,str,str");
		address_rangesGrid.setColTypes("ro,ed,ed,ed");
		address_rangesGrid.enableEditTabOnly(1);
		address_rangesGrid.setInitWidths("100,100,100,*");
		address_rangesGrid.setColAlign("center,center,center,left");
		// address_rangesGrid.enableAlterCss("even_row","odd_row");
		address_rangesGrid.load("../address_ranges/address_ranges_by_site.xml?id="+node_id, function() {
			address_rangesGrid.enableStableSorting(true);
			address_rangesGrid.sortRows(1,"str","asc");
			address_rangesGrid.sortRows(0,"str","asc");
		});
		/* address_rangesGrid.attachEvent("onRowDblClicked",function(id){
		 address_rangesTree.selectItem(id,true);
		 showFileContent(id);
		 }) */
		address_rangesGrid.attachEvent("onRowSelect", function() {
			address_rangesToolbar.enableItem("delete")
		});
		address_rangesGrid.attachEvent("onClearAll",address_rangesToolbar.disableItem("delete"));

		address_rangesGrid.init();

		address_rangesDP = new dataProcessor("../address_ranges/dbaction_sitenode.xml?id="+node_id);
		address_rangesDP.init(address_rangesGrid);
	} else {
		address_rangesToolbar.disableItem("add");
		address_rangesToolbar.disableItem("delete");
		address_rangesGrid.setHeader("Site, Subnet, First Address, Last Address, Description");
		address_rangesGrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
		address_rangesGrid.setSizes();
		address_rangesGrid.setColSorting("str,str,str,str,str");
		address_rangesGrid.setColTypes("ro,ro,ed,ed,ed");
		address_rangesGrid.enableEditTabOnly(1);
		address_rangesGrid.setInitWidths("100,100,100,100,*");
		address_rangesGrid.setColAlign("center,center,center,center,left");
		// address_rangesGrid.enableAlterCss("even_row","odd_row");
		address_rangesGrid.load("../address_ranges/address_ranges_by_network.xml?id="+node_id, function() {
			address_rangesGrid.enableStableSorting(true);
			address_rangesGrid.sortRows(2,"str","asc");
			address_rangesGrid.sortRows(1,"str","asc");
			address_rangesGrid.sortRows(0,"str","asc");
		});
		/* address_rangesGrid.attachEvent("onRowDblClicked",function(id){
		 address_rangesTree.selectItem(id,true);
		 showFileContent(id);
		 }) */
		address_rangesGrid.attachEvent("onRowSelect", function() {
			address_rangesToolbar.enableItem("delete")
		});
		address_rangesGrid.attachEvent("onClearAll",address_rangesToolbar.disableItem("delete"));

		address_rangesGrid.init();

		address_rangesDP = new dataProcessor("../address_ranges/dbaction_networknode.xml?id="+node_id);
		address_rangesDP.init(address_rangesGrid);
	}
}

function address_rangesClearFilter() {
	address_rangesGrid.filterBy(0,"");
	address_rangesGrid._f_rowsBuffer = null;
}

function addAddress_range() {
	address_rangesClearFilter();
	address_rangesGrid.addRow(address_rangesGrid.uid(),['','',''],0);
	address_rangesGrid.selectCell(0,0,false,true,true);
	window.setTimeout( function() {
		address_rangesGrid.editCell();
	},1);
}

function deleteAddress_range() {
	address_rangesClearFilter();
	address_rangesGrid.deleteSelectedRows();
}

//
//	domain_namesGrid
//

function showDomain_namesGrid() {
	domain_namesGrid = domain_namesLayout.cells("a").attachGrid();
	domain_namesGrid.setImagePath("../javascripts/imgs/");
	domain_namesGrid.setHeader("Fully-qualified Domain Name, Description");
	domain_namesGrid.attachHeader("#text_filter,#text_filter");
	domain_namesGrid.setSizes();
	domain_namesGrid.setColSorting("str,str");
	domain_namesGrid.setColTypes("ed,ed");
	domain_namesGrid.enableEditTabOnly(1);
	domain_namesGrid.setInitWidths("225,*");
	domain_namesGrid.setColAlign("left,left");
	// domain_namesGrid.enableAlterCss("even_row","odd_row");
	domain_namesGrid.load("../domain_names/data.xml");
	/* domain_namesGrid.attachEvent("onRowDblClicked",function(id){
	 domain_namesTree.selectItem(id,true);
	 showFileContent(id);
	 }) */
	domain_namesGrid.init();
}

dp = new dataProcessor("../domain_names/dbaction.xml");
dp.init(domain_namesGrid);
function domain_namesClearFilter() {
	domain_namesGrid.filterBy(0,"");
	domain_namesGrid._f_rowsBuffer = null;
}

function add() {
	domain_namesClearFilter();
	domain_namesGrid.addRow(domain_namesGrid.uid(), 'new subnet');
}

function remove() {
	domain_namesClearFilter();
	domain_namesGrid.deleteSelectedRows();
}