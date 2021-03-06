module RakutenWebServiceHelper
  require 'rest-client'
  require 'json'

  @@applicationId = '1024174919872416244'
  @@hits = 6
  @@page = 1
  @@url = "https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706"

  def queryItem(keyword)
    puts keyword
    json = RestClient.get(@@url, {params: {
                                            'format' => 'json',
                                            'applicationId' => @@applicationId,
                                            'hits'=>@@hits,
                                            'page'=>@@page,
                                            'keyword' => keyword
                                            }
                                  })

    resultList = []
    result = JSON.parse(json)

    puts result

    result['Items'].each do |map|
      resultList.push({
        'itemName' => map['Item']['itemName'],
        'itemPrice' => map['Item']['itemPrice'],
        'imageUrl' => map['Item']['smallImageUrls'].first['imageUrl']
        })
    end
    return resultList
  end
end
