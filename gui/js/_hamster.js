//Format Date Fuction added
function formatDate(date) {
  var day = date.getDate();
  if (day < 10)
    day = "0" + day;
  var month = date.getMonth() + 1;
  if (month < 10)
    month = "0" + month;
  var year = date.getFullYear();
  return day + '-' + month + '-' + year;
}

var supplyTypes = ["fruits","cereals","nuts"];
var supplyTmpl = _.template(
    "        <tr class=\"<%= classType%>\">\n" +
    "            <th scope=\"row\"><%= index%></th>\n" +
    "            <td><%= supply%></td>\n" +
    "            <td><%= type%></td>\n" +
    "            <td><%= date%></td>\n" +
    "            <td><%= weight%></td>\n" +
    "        </tr>");
$.ajax('/HamsterSupply.json',{
    success: function(response) {
        var supply = response.supply,
            //orderedSupply = {},
            //Added orderedSupplyFull
            orderedSupplyFull = [],
            breakfast = {},
            totalWeight = 0,
            index = 0,
            //Added tempLen for orderedSupplyFull to determine Typies
            tempLen = 0;
        if (!_.isNil(supply)) {
            _.each (supplyTypes, function (type) {
                //orderedSupply[type] = _.sortBy(supply[type],function (a) {return -1*a.weight;});
                breakfast[type] = _.takeRight(_.sortBy(supply[type],function (a) {return -1 * Date.parse(a.date);},1));

                //New part
                orderedSupplyFull = orderedSupplyFull.concat(supply[type]);
                for (var i = tempLen; i < orderedSupplyFull.length; i++)
                {
                  orderedSupplyFull[i].type = type;
                  if (orderedSupplyFull[i].name == breakfast[type][0].name
                    && orderedSupplyFull[i].weight == breakfast[type][0].weight
                    && formatDate(new Date(orderedSupplyFull[i].date)) == formatDate(new Date(breakfast[type][0].date))
                  ){
                    orderedSupplyFull[i].class = "bg-info text-white";
                  }
                  else{
                    orderedSupplyFull[i].class = "supply-field";
                  }
                }

                tempLen = orderedSupplyFull.length;
                //End new Part

                totalWeight += _.reduce(supply[type],function(r,v,k) {
                   return r + (+v.weight);
                },0);
                totalWeight -= breakfast[type][0].weight;

                //Old code for differen Typies
                /*
                _.each(orderedSupply[type],function(v) {
                    $('.js-hamster-supply')[0].innerHTML += supplyTmpl(
                      {
                        index: index,
                        supply: v.name,
                        type: type,
                        date: formatDate(new Date(v.date)), //Format Date Function Used
                        weight: +v.weight
                      }
                    );
                    index += 1;
                });
                */
            });

            //console.log(orderedSupply);
            console.log(breakfast);
            console.log(totalWeight);

            //New part
            //console.log(orderedSupplyFull);
            orderedSupplyFull = _.sortBy(orderedSupplyFull,function (a) {return -1*a.weight;});
            console.log(orderedSupplyFull);

            for (index = 0; index < orderedSupplyFull.length; index++)
            {
              $('.js-hamster-supply')[0].innerHTML += supplyTmpl(
                {
                  index: index,
                  supply: orderedSupplyFull[index].name,
                  type: orderedSupplyFull[index].type,//orderedSupplyFull[index].type,
                  date: formatDate(new Date(orderedSupplyFull[index].date)), //Format Date Function Used
                  weight: orderedSupplyFull[index].weight,
                  classType: orderedSupplyFull[index].class
                }
              );
            }
            //End New Part

        }
    }
});
