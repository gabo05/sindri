# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
    $(".gantt").gantt
        source: [{
            name: "Sprint 0",
            desc: "Analysis",
            values: [{
                from: "/Date(1320192000000)/",
                to: "/Date(1322401600000)/",
                label: "Requirement Gathering",
                customClass: "ganttRed"
            }]
            },{
            name: " ",
            desc: "Scoping",
            values: [{
                from: "/Date(1322611200000)/",
                to: "/Date(1323302400000)/",
                label: "Scoping",
                customClass: "ganttRed"
            }]
            },{
            name: "Sprint 1",
            desc: "Development",
            values: [{
                from: "/Date(1323802400000)/",
                to: "/Date(1325685200000)/",
                label: "Development",
                customClass: "ganttGreen"
            }]
            },{
            name: " ",
            desc: "Showcasing",
            values: [{
                from: "/Date(1325685200000)/",
                to: "/Date(1325695200000)/",
                label: "Showcasing",
                customClass: "ganttBlue"
            }]
            },{
            name: "Sprint 2",
            desc: "Development",
            values: [{
                from: "/Date(1326785200000)/",
                to: "/Date(1325785200000)/",
                label: "Development",
                customClass: "ganttGreen"
            }]
            },{
            name: " ",
            desc: "Showcasing",
            values: [{
                from: "/Date(1328785200000)/",
                to: "/Date(1328905200000)/",
                label: "Showcasing",
                customClass: "ganttBlue"
            }]
            },{
            name: "Release Stage",
            desc: "Training",
            values: [{
                from: "/Date(1330011200000)/",
                to: "/Date(1336611200000)/",
                label: "Training",
                customClass: "ganttOrange"
            }]
            },{
            name: " ",
            desc: "Deployment",
            values: [{
                from: "/Date(1336611200000)/",
                to: "/Date(1338711200000)/",
                label: "Deployment",
                customClass: "ganttOrange"
            }]
            },{
            name: " ",
            desc: "Warranty Period",
            values: [{
                from: "/Date(1336611200000)/",
                to: "/Date(1349711200000)/",
                label: "Warranty Period",
                customClass: "ganttOrange"
            }]
        }]
        navigate: "scroll"
        maxScale: "hours"
        itemsPerPage: 10
        onItemClick: (data) -> 
            alert "Item clicked - show some details"
        onAddClick: (dt, rowId) ->
            alert "Empty space clicked - add an item!"
        onRender: () -> 
            if window.console and typeof console.log is "function"
                console.log "chart rendered"
