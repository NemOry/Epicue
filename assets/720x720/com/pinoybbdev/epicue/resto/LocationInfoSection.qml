import bb.cascades 1.0
import bb.cascades.maps 1.0
import bb.platform 1.0

import "../component"
import "../container"

Container {
    horizontalAlignment: HorizontalAlignment.Fill
    
    topPadding: 20
    leftPadding: 12
    rightPadding: 12
    bottomPadding: 50
    
    Container {
        id: locationContainer
        layout: DockLayout {
        
        }
        
        translationY: 35
        horizontalAlignment: HorizontalAlignment.Fill
        
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            id: infoContainer
            
            Container {
                id: addressContainer
                layout: DockLayout {
                    
                }
                
                horizontalAlignment: HorizontalAlignment.Fill
                
                bottomMargin: 20
                Container {
                    id: navContainer
                    layout: StackLayout {
                        orientation: LayoutOrientation.RightToLeft
                    }
                    
                    horizontalAlignment: HorizontalAlignment.Right
                    verticalAlignment: VerticalAlignment.Top
                    
                    ImageButton {
                        id: navButton
                        defaultImageSource: "asset:///images/app_icons/ic_nav_to_orig_2.png"
                    }
                }
            }
        }
        
        ActivityIndicator {
            id: loadIndicator
            preferredWidth: 100
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
        }
    
    }
    
    onCreationCompleted: {
        loadMap()
    }
    
    attachedObjects: [
        Label {
            id: distanceLabel
            text: thedata.distance
            horizontalAlignment: HorizontalAlignment.Right
            verticalAlignment: VerticalAlignment.Bottom
            textStyle.fontWeight: FontWeight.W100
            textStyle.fontSize: FontSize.XXSmall
            multiline: true
        },
        Label {
            id: addressLabel
            
            text: thedata.address
            horizontalAlignment: HorizontalAlignment.Left
            textStyle.fontWeight: FontWeight.W100
            textStyle.fontSize: FontSize.Small
            multiline: true
        },
        Container {
            id: mapContainer
            layout: DockLayout {
                
            }
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Center
            
            MapView {
                id: mapView
                
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Center
                
                latitude: thedata.latitude
                longitude: thedata.longitude
                
                preferredHeight: 300
                
                leftPadding: 0
                rightPadding: 0
                leftMargin: 0
                rightMargin: 0
                bottomPadding: 0
                bottomMargin: 0
                
                gestureHandlers: [
                    TapHandler {
                        onTapped: {
//                            Route
                        }
                    }
                ]
            }
            
	        ImageView {
	            imageSource: "asset:///images/map_marker.png"
	            
	            horizontalAlignment: HorizontalAlignment.Center
	            verticalAlignment: VerticalAlignment.Center
	        }
        },
        LocationMapInvoker {
          	id: locationMap
          	locationLatitude: mapView.latitude
          	locationLongitude: mapView.longitude
          	locationName: "Sentro 1771"
          	centerLatitude: mapView.latitude
          	centerLongitude: mapView.longitude
          	currentLocationEnabled: true
        },
        RouteMapInvoker {
            id: routeMap
            currentLocationEnabled: true
            
            endLatitude: mapView.latitude
            endLongitude: mapView.longitude
        }
    ]
    
    function loadMap() {
        //start activity 
        loadIndicator.start();
        //add map
        navContainer.add(distanceLabel);
        addressContainer.add(addressLabel);
        infoContainer.add(mapContainer);
        
        mapView.setCaptionGoButtonVisible(true);
        
        loadIndicator.stop();
        locationContainer.remove(loadIndicator);
    }
}  