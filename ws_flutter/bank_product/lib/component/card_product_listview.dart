import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '딩딩신용카드',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpan(
                        text: '로',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpan(
                        text: '\n누리는 할인 혜택',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              ListTile(
                leading: Icon(Icons.local_gas_station_rounded, color: Colors.amber,),
                title: Text('주유 / 자동차',style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:'전 주유소 리터당',
                        style: TextStyle(
                          color: Colors.grey[600]
                        )
                      ),
                      TextSpan(
                        text: ' 60원',
                        style: TextStyle(
                          color: Color.fromARGB(255, 215, 25, 31)
                        )
                      ),
                      TextSpan(
                        text:' 할인(LPG포함)',
                        style: TextStyle(
                          color: Colors.grey[600]
                        )
                      ),
                    ]
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.dining_outlined, color: Colors.amber),
                title: Text('생활 / 외식',style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:'모든 음식점업종',
                        style: TextStyle(
                          color: Colors.grey[600]
                        )
                      ),
                      TextSpan(
                        text: ' 10%',
                        style: TextStyle(
                          color: Color.fromARGB(255, 215, 25, 31)
                        )
                      ),
                      TextSpan(
                        text:' 할인\n스타벅스, 엔제리너스, 파리바게트 등',
                        style: TextStyle(
                          color: Colors.grey[600]
                        )
                      ),
                      TextSpan(
                        text: ' 10%',
                        style: TextStyle(
                          color: Color.fromARGB(255, 215, 25, 31)
                        )
                      ),
                      TextSpan(
                        text:' 할인',
                        style: TextStyle(
                          color: Colors.grey[600]
                        )
                      ),
                    ]
                  ),
                ),
                isThreeLine: true,
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.shopping_basket_rounded, color: Colors.amber),
                title: Text('쇼핑 / 엔터테인먼트',style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:'전국 영화관',
                        style: TextStyle(
                          color: Colors.grey[600]
                        )
                      ),
                      TextSpan(
                        text: ' 4천원',
                        style: TextStyle(
                          color: Color.fromARGB(255, 215, 25, 31)
                        )
                      ),
                      TextSpan(
                        text:' 할인\n쿠팡, 티몬, 위메프 등',
                        style: TextStyle(
                          color: Colors.grey[600]
                        )
                      ),
                      TextSpan(
                        text: ' 5%',
                        style: TextStyle(
                          color: Color.fromARGB(255, 215, 25, 31)
                        )
                      ),
                      TextSpan(
                        text:' 할인',
                        style: TextStyle(
                          color: Colors.grey[600]
                        )
                      ),
                    ]
                  ),
                ),
                isThreeLine: true,
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.wifi, color: Colors.amber),
                title: Text('통신 / 인터넷',style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:'이동통신요금 자동이체',
                        style: TextStyle(
                          color: Colors.grey[600]
                        )
                      ),
                      TextSpan(
                        text: ' 5%',
                        style: TextStyle(
                          color: Color.fromARGB(255, 215, 25, 31)
                        )
                      ),
                      TextSpan(
                        text:' 할인',
                        style: TextStyle(
                          color: Colors.grey[600]
                        )
                      ),
                    ]
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.directions_subway, color: Colors.amber),
                title: Text('후불교통기능 / 교통할인',style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:'대중교통 이용요금',
                        style: TextStyle(
                          color: Colors.grey[600]
                        )
                      ),
                      TextSpan(
                        text: ' 10%',
                        style: TextStyle(
                          color: Color.fromARGB(255, 215, 25, 31)
                        )
                      ),
                      TextSpan(
                        text:' 할인',
                        style: TextStyle(
                          color: Colors.grey[600]
                        )
                      ),
                    ]
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.castle, color: Colors.amber),
                title: Text('놀이공원',style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:'본인 무료입장 또는 자유이용권',
                        style: TextStyle(
                          color: Colors.grey[600]
                        )
                      ),
                      TextSpan(
                        text: ' 50%',
                        style: TextStyle(
                          color: Color.fromARGB(255, 215, 25, 31)
                        )
                      ),
                      TextSpan(
                        text:' 할인',
                        style: TextStyle(
                          color: Colors.grey[600]
                        )
                      ),
                    ]
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}