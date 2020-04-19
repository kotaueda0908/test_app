/**
 * 背景画像をフェードインアウトで切り替え表示する
 * readyを使うことで、HTMLが読み込みが終わったらfuctionの処理を実行する
 * gt(index)でインデックス番号が指定した数値より大きい要素を選択する
 * hideメソッドを使用し、対象となる要素を引数に応じて非表示にする
 * first-child擬似クラスを使用し、要素内に現れる最初の子要素にスタイルを適用する
 * appendメソッドを使用し、特定の親要素の中に要素を追加する
 */
$(document).ready(function () {
  $(".clImg h1:gt(0)").hide();
  setInterval(function () {
    $(".clImg :first-child")
      .fadeOut()
      .next("h1")
      .fadeIn()
      .end()
      .appendTo(".clImg");
  }, 9000);
});
