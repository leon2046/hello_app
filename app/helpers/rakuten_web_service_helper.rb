module RakutenWebServiceHelper
  require 'rest-client'
  require 'json'

  @@applicationId = '1024174919872416244'
  @@hits = 3
  @@page = 1
  @@url = "https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706"

  def queryItem(keyword)
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
    result['Items'].each do |map|
      resultList.push({
        'itemName' => map['Item']['itemName'],
        'itemPrice' => map['Item']['itemPrice'],
        'imageUrl' => map['Item']['mediumImageUrls'].first['imageUrl']
        })
    end
    return resultList
  end
end
