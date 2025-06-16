const puppeteer = require("puppeteer");

(async () => {
  const browser = await puppeteer.launch({
    args: ["--no-sandbox", "--disable-setuid-sandbox"]
  });

  const page = await browser.newPage();
  await page.goto("https://api.prizepicks.com/projections", {
    waitUntil: "networkidle0"
  });

  const content = await page.evaluate(() => {
    return fetch("https://api.prizepicks.com/projections")
      .then((res) => res.json())
      .then((json) =>
        json.data
          .filter((item) => item.attributes?.sport_identifier === "lol")
          .map((item) => ({
            player: item.attributes.name,
            stat: item.attributes.stat_type,
            line: item.attributes.line,
            team: item.attributes.team,
            projection_id: item.id
          }))
      );
  });

  console.log(JSON.stringify(content, null, 2));
  await browser.close();
})();
